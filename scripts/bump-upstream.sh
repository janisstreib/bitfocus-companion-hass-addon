#!/usr/bin/env bash
# Bump the pinned upstream Bitfocus Companion nightly image in the add-on.
# - Finds the newest "*-main-*" tag of ghcr.io/bitfocus/companion/companion
# - Rewrites both FROM lines in bitfocus-companion/Dockerfile (tag + sha256 digests)
# - Bumps the patch version in bitfocus-companion/config.yaml
# - Prepends a CHANGELOG.md entry
# Exits 0 with "no update" if the newest tag equals the one already pinned.
set -euo pipefail

REPO="bitfocus/companion/companion"
ADDON_DIR="bitfocus-companion"
REGISTRY="https://ghcr.io"

TOKEN=$(curl -sf "${REGISTRY}/token?scope=repository:${REPO}:pull" | python3 -c 'import json,sys;print(json.load(sys.stdin)["token"])')

# --- Find newest main-channel tag (highest build number in "<ver>-<build>-main-<sha>") ---
# The registry caps results per page and ordering is not chronological, so paginate.
ALL_TAGS=""
LAST=""
while : ; do
  if [ -n "${LAST}" ]; then
    PAGE=$(curl -sf -H "Authorization: Bearer ${TOKEN}" "${REGISTRY}/v2/${REPO}/tags/list?n=100&last=${LAST}")
  else
    PAGE=$(curl -sf -H "Authorization: Bearer ${TOKEN}" "${REGISTRY}/v2/${REPO}/tags/list?n=100")
  fi
  BATCH=$(printf '%s' "${PAGE}" | python3 -c 'import json,sys;print("\n".join(json.load(sys.stdin)["tags"]))')
  ALL_TAGS="${ALL_TAGS}
${BATCH}"
  COUNT=$(printf '%s' "${BATCH}" | grep -c . || true)
  [ "${COUNT}" -lt 100 ] && break
  LAST=$(printf '%s' "${BATCH}" | tail -1)
done

NEW_TAG=$(printf '%s' "${ALL_TAGS}" | python3 -c '
import sys
tags = [t for t in sys.stdin.read().split() if "-main-" in t]
def build(t):
    try:
        return int(t.split("-")[1])
    except (IndexError, ValueError):
        return -1
best = max(tags, key=build)
print(best)
')
if [ -z "${NEW_TAG}" ]; then
  echo "ERROR: no main-channel tags found" >&2
  exit 1
fi

# --- Check whether this tag is already pinned ---
CURRENT=$(grep -o 'companion:[^@]*' "${ADDON_DIR}/Dockerfile" | head -1 | sed 's/companion://')
if [ "${CURRENT}" = "${NEW_TAG}" ]; then
  echo "no update: ${NEW_TAG} already pinned"
  exit 0
fi

# --- Fetch per-arch digests from the image index ---
MANIFEST=$(curl -sf -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/vnd.oci.image.index.v1+json,application/vnd.docker.distribution.manifest.list.v2+json" \
  "${REGISTRY}/v2/${REPO}/manifests/${NEW_TAG}")
ARCH_DIGESTS=$(printf '%s' "${MANIFEST}" | python3 -c '
import json, sys
idx = json.load(sys.stdin)
digests = {}
for m in idx.get("manifests", []):
    p = m.get("platform", {})
    if p.get("os") == "linux":
        digests[p["architecture"]] = m["digest"]
print(digests.get("arm64", ""), digests.get("amd64", ""))
')
ARM64_DIGEST=$(echo "${ARCH_DIGESTS}" | cut -d" " -f1)
AMD64_DIGEST=$(echo "${ARCH_DIGESTS}" | cut -d" " -f2)
if [ -z "${ARM64_DIGEST}" ] || [ -z "${AMD64_DIGEST}" ]; then
  echo "ERROR: missing arm64 or amd64 digest for ${NEW_TAG}" >&2
  exit 1
fi

# --- Rewrite the FROM lines in the Dockerfile ---
sed -i \
  -e "s|^FROM ghcr.io/${REPO}:[^ ]* AS aarch64_image|FROM ghcr.io/${REPO}:${NEW_TAG}@${ARM64_DIGEST} AS aarch64_image|" \
  -e "s|^FROM ghcr.io/${REPO}:[^ ]* AS amd64_image|FROM ghcr.io/${REPO}:${NEW_TAG}@${AMD64_DIGEST} AS amd64_image|" \
  "${ADDON_DIR}/Dockerfile"

# --- Bump patch version in config.yaml ---
python3 - "${ADDON_DIR}/config.yaml" <<'EOF'
import re, sys
path = sys.argv[1]
text = open(path).read()
m = re.search(r'^version:\s*"(\d+)\.(\d+)\.(\d+)"', text, re.M)
if not m:
    sys.exit("ERROR: version not found in " + path)
major, minor, patch = (int(g) for g in m.groups())
new = f'{major}.{minor}.{patch + 1}'
text = text.replace(m.group(0), f'version: "{new}"', 1)
open(path, "w").write(text)
print(new)
EOF
NEW_VERSION=$(grep -o '^version: "[^"]*"' "${ADDON_DIR}/config.yaml" | sed 's/version: "//;s/"//')

# --- Prepend CHANGELOG entry ---
{
  echo "## ${NEW_VERSION}"
  echo "Updated Companion docker image to ${NEW_TAG} (beta)"
  echo ""
  cat "${ADDON_DIR}/CHANGELOG.md"
} > "${ADDON_DIR}/CHANGELOG.md.tmp" && mv "${ADDON_DIR}/CHANGELOG.md.tmp" "${ADDON_DIR}/CHANGELOG.md"

echo "updated to ${NEW_TAG} (add-on version ${NEW_VERSION})"

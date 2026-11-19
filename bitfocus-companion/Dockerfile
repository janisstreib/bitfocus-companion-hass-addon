ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10326-main-3af2a3098d@sha256:4a8b34c3e48727a96a554c9ca52db143a92d777590ed4ab780e5dc9070c51d62 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10326-main-3af2a3098d@sha256:f0afc9a195086395298ba5d3adf01b0b5e88e2b36f73e38e18db02d00e4f6e27 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

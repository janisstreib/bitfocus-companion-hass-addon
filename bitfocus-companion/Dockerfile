ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10017-main-911113ebc1@sha256:3544f9216b4849cc7454b6137410e4a75cf7861d1e37a21bbff9c078e5ecf3e6 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10017-main-911113ebc1@sha256:614aafc5c740a1ccce17d58607ddd6442f3190d240fa60c0669ee9bfbbd4a91e AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

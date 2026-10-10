ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9965-main-f4396143f1@sha256:377ae07fb77e3a287c213876277fb29651c15a0d9bc5813dc8809d7e4e2dff21 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9965-main-f4396143f1@sha256:37335dcd3c88586400cd8e2baf1fe3b97b86aebaade5dc1827f474f72d5407c7 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

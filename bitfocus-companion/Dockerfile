ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10193-main-fc6b7bcc86@sha256:7c0d7f502834e34ade4293a4ed04c5804d0f8c89a3a14417810fc7a333b0e530 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10193-main-fc6b7bcc86@sha256:dedf66596a4d63b2f96fd979d8adf6249bd58685ca8aa434d888343dd8733a8f AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

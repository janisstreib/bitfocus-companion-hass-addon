ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10138-main-266c7524af@sha256:0c9534a03713f04541ad294416488dfc80aead3427da8d2a32e642c18c916cb5 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10138-main-266c7524af@sha256:7d86a187d4ad783119805cb6fd96ce5f61346edab8d6ad0977016349a13fc74d AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.0.0-9626-main-c99d432b81@sha256:43fd1dea7c968b7db15ad609601425adea929c47d95e00a4f8b6e7a269b75def AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.0.0-9626-main-c99d432b81@sha256:3dfbf4c4ecdee14ea6490eab7f186f4d5729b4cc148f69a5dc8a5357868c9622 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

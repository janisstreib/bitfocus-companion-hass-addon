ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9818-main-2b7f02ad39@sha256:3f715ecb6ffc7e853a5a38c6a3b70005c3b5a89659700508ba30abf2bd9a62ce AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9818-main-2b7f02ad39@sha256:ad2694b7b1df702dc2640b7be9e50179db6b38ec9ffa2fea033dcdbe4af1d654 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

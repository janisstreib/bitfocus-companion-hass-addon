ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10167-main-55cf4966f3@sha256:629363b5c42644e98c23ef753cb68735e21cb1c67d709c8d4dc69f67f26cf9ad AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10167-main-55cf4966f3@sha256:3cbea9e3a368c4cf9c8c51b3c1696c97d40a4e5f4ea11389eefaa4f94d3ab3f2 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

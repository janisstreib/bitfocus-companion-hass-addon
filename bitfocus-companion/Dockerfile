ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10242-main-6398bc8c85@sha256:7e9637acb4a518c3a843e332d7d34db7181495b60b90dcbba6718cdbac3f24a8 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10242-main-6398bc8c85@sha256:33a826e21c8d44429284ab94697b640237281f3a456ea50a97f73ec9bea72ea4 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

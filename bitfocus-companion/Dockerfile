ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10269-main-ab78577252@sha256:d9a9bd1b7e8b5eb1157576296f304483350d7a10f3ab8fdd123ec794767d337a AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10269-main-ab78577252@sha256:f3b166880cbcb686e8ff9b249ec5f4094ba9b9a7a0a345ee34f1b944acf1b8d8 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

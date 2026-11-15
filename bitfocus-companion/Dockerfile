ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10298-main-7213ebd729@sha256:23b08cf0b1d935ee463be5c969c95ba4ab4b3d4164ce8b80ae20a18024ee5f93 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10298-main-7213ebd729@sha256:3c08fa4a1b40d1978ffa35e02b5c02d540025c3e2853600fd705bd0a52f5dcae AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

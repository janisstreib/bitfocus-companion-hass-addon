ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10061-main-78c8699089@sha256:3c56d733ebfcc42747e3ae99512e1cc4b10c05923045b2e9cb08b86394563dd3 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10061-main-78c8699089@sha256:4528b64f2241cd298fb3733aa24c0222a81c050ef70f9580e6be6b2286892079 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10031-main-63c9930c47@sha256:8cc681ccb959237bb94b79e2c0047b94578e8607174d1c8a645629528e13abe2 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10031-main-63c9930c47@sha256:4ded31cd9240fc4f645860e25b806ad3a9e5eb47e115b6e819851e3add036f11 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

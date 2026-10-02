ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9942-main-a931502330@sha256:878b89340fd0dbd46c20c7a5a42663e3d653cac62fd86fa9547269a5c75c8665 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9942-main-a931502330@sha256:9c399a8ea803a73c0ec5f2f4e49aa65ec3db3e785d0e3350cf217dd5dc8c278e AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10321-main-3e04b442e1@sha256:543ef7150805820e7e90f9205c39f43458295533617105628fb4bcbb34511a76 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10321-main-3e04b442e1@sha256:f385a85c33b8db2afedcab8b3b1e14500fc8cd9c281d871db4d25f6b540a57c5 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

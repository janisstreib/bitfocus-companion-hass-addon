ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10311-main-4e3cc81da6@sha256:874d2abca8b6ffbed9c098793048d8f30c75401a1438962a3d6dfb8ea6a7e2bb AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10311-main-4e3cc81da6@sha256:d4744488e4cc51428398f2e59556a0fc5427973e67a0556dee48e9b9f3636780 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

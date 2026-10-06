ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9953-main-b615afd3be@sha256:f7d925bed1624511593d978b2cea1733fc4cb0fa625bac495081ec163e2b2dac AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9953-main-b615afd3be@sha256:f2c4c64e817a14f2c289cd4ecb283b62e0b4c8b721eccb1500281d3ab6dde0ba AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

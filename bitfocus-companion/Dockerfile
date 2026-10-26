ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10120-main-5553ea6ef1@sha256:489b6523cc2dbc0b05225176f5da0628b87e63fddf254f187c3b80594674f81e AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10120-main-5553ea6ef1@sha256:dda2572f777be2cef7e1c9a6c211cdf358c61826c2facaf9c8b746ee9dbd22ae AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

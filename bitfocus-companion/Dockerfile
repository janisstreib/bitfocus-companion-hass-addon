ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9930-main-88d611ec0a@sha256:6e57b00620fa9e262343430b50b2f002b0bea5a049c1a81189ab2d2af2f7578f AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9930-main-88d611ec0a@sha256:5be8079c7db00cc27289aba3a2bd4ca1751919581fb7cf21a7c65d12963ae18c AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10333-main-aaa78b52fa@sha256:aace5f53abb6b982702f2a22d5a14a7d11dd95608d7481ad134d2329a78867f1 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10333-main-aaa78b52fa@sha256:960586bb9764a0cc2c4357d1217fbd12166c3104edc55b78810f92b20221162b AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

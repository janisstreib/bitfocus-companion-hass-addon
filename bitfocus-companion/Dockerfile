ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10259-main-baca5b4cc8@sha256:70afc80c405dd72b7d429504dad072be23fed689f0c196bdaf4b0355cc7306b4 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10259-main-baca5b4cc8@sha256:fca7af5a011ed01d1c7f45fd0122cfc4a4433e6c1528067a2f6832805d9fd184 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

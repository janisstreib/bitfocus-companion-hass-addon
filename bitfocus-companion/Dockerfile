ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10002-main-41ec305d75@sha256:e6936dc0c94cb96f603189519ded99cbc8c165ce498ad87b0bd5aaf7738aa4ea AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10002-main-41ec305d75@sha256:ef691ee515288651fd96bdaf83928ed96f4555e9415b66b9dbbbe64e1ef6eb38 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

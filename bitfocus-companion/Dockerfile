ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10027-main-eee648c42b@sha256:de19c136509baa488fa9e01865a463177705650ddc07f0f6f56374df65e63179 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10027-main-eee648c42b@sha256:21d6f007656e0d8efa5dd4bb640bd93d5e6853844d9c985603500c1e50ff4194 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10006-main-2fd7dc54c7@sha256:9b39e16c7ced8af65ababd64ef029e6f9f5366e6fa7a77f5d6b5372e4d42f331 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10006-main-2fd7dc54c7@sha256:32da0a1861d16a4e1edd2cbb70d72ef61ad764849ac0082481ec90d58af34f5e AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

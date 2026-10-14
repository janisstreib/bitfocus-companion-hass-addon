ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9991-main-a9ae84a198@sha256:df165eb8ebbb3683b67e362bd18caebbc8aa4de64609f22b03485cab1b6d56ea AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9991-main-a9ae84a198@sha256:ba8f6f874a61744a3f8ec83b7878cfd704c1dde330fc92910b450d5d6300d776 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

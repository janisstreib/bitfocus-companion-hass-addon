ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10025-main-bef66ef26e@sha256:9e761277cb8559fb15504275ebfaf5042aa9e284a9e7d1244399d9e9becb0eea AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10025-main-bef66ef26e@sha256:561e7d44929148df210a517e145dbba0d878d3be589dd88ce6cdb2e83e6086d1 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

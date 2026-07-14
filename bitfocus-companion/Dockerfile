ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9664-main-18291cbf27@sha256:fdf70a46e7466a7a7773e5a49f5ef6986c1704fd53cc594deab76239c26a513c AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9664-main-18291cbf27@sha256:c8211d43fe7b70b7600d3546cac3d7e53b38fc330a301f87acde83d09963edd9 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

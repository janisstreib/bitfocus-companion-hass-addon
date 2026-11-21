ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10329-main-38099f7d0c@sha256:525249fd6c3f8b64710243c80acc90b025b84a222edacdd9003c47a584763ffb AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10329-main-38099f7d0c@sha256:9f5a00e63db7c395e3c67c78f65f42b73af8cb050a7f61d7513ff834a65a4941 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

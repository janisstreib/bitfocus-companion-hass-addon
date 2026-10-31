ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10176-main-9166e7a0a0@sha256:3fc2904f4f0e078868314c40c050a775d66b7069e64f47c3949d5876e690d06c AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10176-main-9166e7a0a0@sha256:128e26eadad0da7a0a961afdf22e1e3cf87172a8de011a0bc96640297844a0dd AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

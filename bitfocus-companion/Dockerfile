ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10236-main-25bfc8a4e8@sha256:b73923c820c354b85ed8d98f0e3a980d8cb29a873f6a7c380a7264a9c34b1a97 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10236-main-25bfc8a4e8@sha256:5b1dbb07710f1e3ae9e0764d570c3a6afe2a26eb8679817f7aabbdb6b41e355d AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

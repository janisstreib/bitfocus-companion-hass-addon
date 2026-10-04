ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9951-main-5eaea25541@sha256:ebf8ba14489ba9c977134d9735073a59e5448e496f206278c9b64bd9f9878a8f AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9951-main-5eaea25541@sha256:7b29786b4158699b817547d2f96f3d0c3330d50aec936f69ea9eea6704833121 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

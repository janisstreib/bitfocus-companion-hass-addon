ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9982-main-404070f390@sha256:2655cb5ec5c6158e967f1e47fc311fa7983016128f8430dad4a9800fb4c72ead AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9982-main-404070f390@sha256:e54447712f272694c0bed12f260c688297c6fc265cbb23ddd7915f4442a83f58 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

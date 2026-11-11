ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10254-main-b28ba59a95@sha256:04a227aa6128efb9b4ebfbcdf6fefcfbffe86f99e7f161a52318cb8f9fd2a365 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10254-main-b28ba59a95@sha256:bd60d911b2c2de520e0b27ffb72ff3458bdfbb414b13aaae491e91125c2f2f78 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

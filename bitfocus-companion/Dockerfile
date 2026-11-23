ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10334-main-7f4c2ec499@sha256:078601f798c12a060cd99a2fa1fc48661308f6d41a2cc3d94b8deffd1bac69c8 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10334-main-7f4c2ec499@sha256:54e5c7ed072ea7f470eaf857b404f93f32c1cb5c8a70f146850749b41be90996 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

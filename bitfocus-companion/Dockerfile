ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9956-main-30fcf8e96e@sha256:1fd457d54a75d2a2ae08fbc4dc7ac3f2abaa735f40040587c7888e031e3d4af4 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9956-main-30fcf8e96e@sha256:0bcc3faefd070c203ea98d7e4912648d39b2b7112f85d6ef4a1e629865a4e41f AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

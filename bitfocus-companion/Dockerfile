ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10262-main-ea722db1e6@sha256:37813a59db91d5798bb6f06ff41a16067ada65d12ce6b3882b2c3f237d027a5c AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10262-main-ea722db1e6@sha256:fc99588a9d5d367fe16a24ee2a43879a64fe5bc7237796df4a22ca2c37185dbc AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9994-main-197cf2a230@sha256:0ef426bf1a98932ad1a479cf6b68fbe2bf8d233f9f80d74df5b8a40358a0b040 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-9994-main-197cf2a230@sha256:df05557611a255632d09378481327a1c0e0c55d73c805241204461ed172940aa AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

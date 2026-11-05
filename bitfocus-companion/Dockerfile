ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10229-main-b9b433e7a6@sha256:eea1056b83e097e628de70979cfa9334bb7c4f29e2dcbd467c467e788f129e79 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10229-main-b9b433e7a6@sha256:6bd1083454cd1ba5cadfa0f93087035b44cdc2f2b27d4948b2e08d7187c6a031 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

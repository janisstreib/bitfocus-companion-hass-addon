ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9943-main-7c83ae6ceb@sha256:6ae20df6409eb7fab5ec0a05fae65a06e09bfcb9efe407a80860bc95b3208f93 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.1.0-9943-main-7c83ae6ceb@sha256:1974bac6588246ce12d4966e7861742531023acb1cad59e244c357bfb0c3f583 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

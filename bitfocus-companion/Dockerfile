ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10310-main-97e9b4d44d@sha256:3cbd46bec9117a9371eafca1d0a5d3da7826aec3dc38001fc97abe77b606066b AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10310-main-97e9b4d44d@sha256:95b85a520d7c65dc6632b1ff5bd2022cb2c0116b95ae52b870de5a061fa19edb AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

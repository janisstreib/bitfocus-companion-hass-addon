ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10158-main-876b17cfe7@sha256:478dcf5a814374c970c1b9d273c2ba448a86819b1eb17f209a665b4c8125f39f AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10158-main-876b17cfe7@sha256:6099472288262e256aaff0487525a4304e2c5d6417b21336e4b7f0068db05050 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

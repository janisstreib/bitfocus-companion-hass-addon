ARG BUILD_ARCH=aarch64

# Selecteer de juiste image op basis van de architectuur linux/arm64=aarch64_image linux/amd64=amd64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10011-main-ff442afb7e@sha256:2198973e1fdd7a01b619851f43e1093baa15bc383691c45baa96d9f2ab6df0c7 AS aarch64_image
FROM ghcr.io/bitfocus/companion/companion:5.2.0-10011-main-ff442afb7e@sha256:468e781a50b6d158343740eb42cb10f6a31ba73499b22bab87cf8ca6031a5ae1 AS amd64_image

# De eigenlijke image die wordt gebruikt
FROM ${BUILD_ARCH}_image

USER root

# Kopieer het startup script
COPY run.sh /run_companion.sh
RUN chmod +x /run_companion.sh

# Verander het entrypoint
ENTRYPOINT ["/run_companion.sh"]

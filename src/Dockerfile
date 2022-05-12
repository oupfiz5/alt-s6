# * Base image
ARG BASE_IMAGE_NAME="${BASE_IMAGE_NAME}" \
    BASE_IMAGE_TAG="${BASE_IMAGE_TAG}"
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}

# * Arguments
ARG S6_OVERLAY_VERSION="${S6_OVERLAY_VERSION}" \
    BUILD_DATE="${BUILD_DATE}"

# * Maintainer
MAINTAINER "Oupfiz V <oupfiz5@yandex.ru>"

# * Labels
LABEL \
    maintainer="Oupfiz V <oupfiz5@yandex.ru>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.authors="Oupfiz V (Five)" \
    org.opencontainers.image.url="https://chiselapp.com/user/oupfiz5/repository/alt-s6/home" \
    org.opencontainers.image.documentation="https://chiselapp.com/user/oupfiz5/repository/alt-s6/wiki" \
    org.opencontainers.image.source="https://chiselapp.com/user/oupfiz5/repository/alt-s6/brlist" \
    org.opencontainers.image.version="0.0.1d" \
    org.opencontainers.image.revision="" \
    org.opencontainers.image.vendor="" \
    org.opencontainers.image.licenses="" \
    org.opencontainers.image.ref.name="" \
    org.opencontainers.image.title="Alt image with s6 init system" \
    org.opencontainers.image.description="Alt base docker image using s6-overlay" \
    org.opencontainers.alt.version="${BASE_IMAGE_TAG}" \
    org.opencontainers.s6overlay.version="${S6_OVERLAY_VERSION}"

# * Environment

# * Copy
COPY rootfs/ /

# * Add
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-symlinks-arch.tar.xz /tmp


# * Run
# hadolint ignore=DL3008,DL3003,DL3015
RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /var/cache/apt/*.bin && \
    cd /tmp && \
    tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-symlinks-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-symlinks-arch.tar.xz && \
    rm /tmp/s6-overlay-noarch.tar.xz && \
    rm /tmp/s6-overlay-x86_64.tar.xz && \
    rm /tmp/s6-overlay-symlinks-noarch.tar.xz && \
    rm /tmp/s6-overlay-symlinks-arch.tar.xz

# * Entrypoint
ENTRYPOINT ["/init"]

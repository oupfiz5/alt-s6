#!/bin/bash
  set -a
  # shellcheck disable=SC1091
  source ../VERSIONS
  set +a

  IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"
  DOCKERFILE="${DOCKERFILE:-Dockerfile}"

  docker buildx build \
          --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
          --build-arg S6_OVERLAY_VERSION="${S6_OVERLAY_VERSION}" \
          --build-arg BASE_IMAGE_TAG="${BASE_IMAGE_TAG}" \
          --build-arg BASE_IMAGE_NAME="${BASE_IMAGE_NAME}" \
          -t "${IMAGE}" \
          -f ../"${DOCKERFILE}" \
          ../.

#!/bin/bash
set -a
# shellcheck disable=SC1091
source ../VERSIONS
set +a

IMAGE="${IMAGE:-${IMAGE_REPOSITORY}/${IMAGE_NAME}:${IMAGE_TAG}}"

docker push "${IMAGE}"

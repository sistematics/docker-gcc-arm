#!/bin/bash
source ./.env

set -e
docker buildx build --platform linux/amd64,linux/arm64 -t ${DOCKER_LOGIN}/${NAME}:${VERSION} --push --pull --no-cache .

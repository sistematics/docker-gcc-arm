#!/bin/bash
source ./.env

set -e

docker pull ${DOCKER_LOGIN}/${NAME}:${VERSION}
docker tag ${DOCKER_LOGIN}/${NAME}:${VERSION} ${DOCKER_LOGIN}/${NAME}:latest
docker push ${DOCKER_LOGIN}/${NAME}:latest

#!/bin/bash

source config.sh

docker build \
    --tag ${image_name}:${version} \
    --build-arg DOWNLOAD_URL=${download_url} \
    --build-arg CELLRANGER_ARC_VERSION=${version} .
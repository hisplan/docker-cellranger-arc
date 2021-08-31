#!/bin/bash -e

source config.sh

# cellranger
docker run -it --rm \
    cellranger-arc:${version} --help

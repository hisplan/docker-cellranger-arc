#!/bin/bash

docker login
docker tag cellranger-arc:1.0.0 hisplan/cellranger-arc:1.0.0
docker push hisplan/cellranger-arc:1.0.0

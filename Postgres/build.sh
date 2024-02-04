#!/bin/bash

# build and push
docker buildx build --platform linux/amd64,linux/arm64 --push -t simplycodedsoftware/postgres:16.1 .
#!/bin/bash

DOCKER_BUILDKIT=1 docker-compose build dev
docker-compose run --rm dev ./test.sh

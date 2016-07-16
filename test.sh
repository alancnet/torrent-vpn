#!/bin/bash

./build.sh && \
docker-compose -f test.yml up


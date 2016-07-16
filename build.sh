#!/bin/bash

docker build -t torrent-vpn-base -f base.Dockerfile . && \
docker build -t torrent-vpn-local -f local.Dockerfile . && \
docker build -t torrent-vpn-remote -f remote.Dockerfile .

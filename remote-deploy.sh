#!/bin/bash

if [ -z "$1" ]; then
  CONTAINER_NAME=""
else
  CONTAINER_NAME="$1"
fi

cd "$(dirname "$0")"
docker --context prod compose -p home-automation up -d --no-deps $CONTAINER_NAME

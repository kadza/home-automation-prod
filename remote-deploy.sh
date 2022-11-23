#!/bin/bash

cd "$(dirname "$0")"
docker --context prod compose pull node-red-home
docker --context prod compose -p home-automation up -d --no-deps node-red-home
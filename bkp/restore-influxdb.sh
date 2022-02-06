#!/bin/bash

cd "$(dirname "$0")"

docker run -id --name influxdb_restore -v home-automation_influxdb-storage:/influxdb_restore alpine
docker cp ./tmp/backup/influxdb-backup/. influxdb_restore:/influxdb_restore
docker stop influxdb_restore
docker rm influxdb_restore
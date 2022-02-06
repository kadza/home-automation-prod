#!/bin/bash

# In case of /var/lib/grafana permission error sudo chown -R 472:472 /var/lib/docker/volumes/home-automation_grafana-storage

cd "$(dirname "$0")"

# In order to set permissions correctly we need to start Grafana first, copy the files, set appropriate persmissions and restart Grafana
# https://github.com/moby/moby/issues/25977
docker run -d --name grafana_restore -v home-automation_grafana-storage:/grafana_restore alpine
docker cp ./tmp/backup/grafana-backup/. grafana_restore:/grafana_restore
docker stop grafana_restore
docker rm grafana_restore

# Don't know why this line is necessary
docker start grafana
docker exec -u root grafana /bin/bash -c 'chown grafana:root /var/lib/grafana/grafana.db'
docker restart grafana
## Quick start
In order to get started with the home automation project, you need to run the following script on host machine:
``` bash
./start.sh
```

In order to deploy the project, you need to create context prod and run the remote-deploy script on dev machine:
``` bash
docker context create prod --docker "host=ssh://luke@192.168.1.170"
./remote-deploy.sh
```
You can find more details here: https://www.docker.com/blog/how-to-deploy-on-remote-docker-hosts-with-docker-compose/

## TODO
* streamline switching between dev and prod
## Deploy

In order to deploy the project, you need to create context prod and run the remote-deploy script on dev machine:

-   copy ssh-id to remote server: `ssh-copy-id username@host_adress`
-   create prod context: `docker context create prod --docker "host=ssh://username@host_address"`
-   run `./remote-deploy.sh`

## Useful links

-   remote deploy: https://www.docker.com/blog/how-to-deploy-on-remote-docker-hosts-with-docker-compose/
-   remote deploy troubleshooting: https://forums.docker.com/t/docker-compose-through-ssh-failing-and-referring-to-docker-example-com/115165/10

## Troubleshooting

-   Permission denied (publickey,password)

```
eval `ssh-agent -s`
ssh-add
```

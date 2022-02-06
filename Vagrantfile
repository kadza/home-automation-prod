Vagrant.configure("2") do |config|
    config.vagrant.plugins = ["vagrant-env", "vagrant-docker-compose"]
    config.vm.box = "hashicorp/bionic64"
    config.vm.synced_folder "../bkp", "/vagrant/bkp"
    config.env.enable

    config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1", id: "grafana"
    config.vm.network "forwarded_port", guest: 1880, host: 1880, host_ip: "127.0.0.1", id: "node-red-home"

    config.vm.provision :docker
    config.vm.provision "shell", inline: "docker login --username kadzaa --password #{ENV['DOCKER_ACCESS_TOKEN']}"

    config.vm.provision "shell", inline: "apt-get update && apt-get install -q -y awscli"

    config.vm.provision "shell", inline: "/vagrant/bkp/init.sh"
    config.vm.provision "shell", inline: "/vagrant/bkp/restore-influxdb.sh"
    config.vm.provision :docker_compose,
        yml: "/vagrant/docker-compose.yaml",
        run: "always",
        compose_version: "1.29.2",
        project_name: "home-automation"
    config.vm.provision "shell", inline: "/vagrant/bkp/restore-grafana.sh"
    config.vm.provision "shell", inline: "/vagrant/bkp/cleanup.sh"
end
# -*- mode: ruby -*-
# vi: set ft=ruby :

user = ENV["USER"]
group = `id -g -n`.chop
home = ENV["HOME"]
shell = ENV["SHELL"]
proxy = ENV["http_proxy"]
no_proxy = ENV["no_proxy"]
uname_s = `uname -s`.chop

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "#{user}.192.168.12.37.xip.io"
  config.vm.network "private_network", ip: "192.168.12.37"
  config.vm.synced_folder home, home, type: "nfs"
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  config.vm.provision "shell", path: "scripts/oasenvtool", run: "always", env: {
    "environment_name": "http_proxy",
    "environment_value": proxy,
  }
  config.vm.provision "shell", path: "scripts/oasenvtool", run: "always", env: {
    "environment_name": "https_proxy",
    "environment_value": proxy,
  }
  config.vm.provision "shell", path: "scripts/oasenvtool", run: "always", env: {
    "environment_name": "no_proxy",
    "environment_value": no_proxy,
  }
  config.vm.provision "shell", path: "scripts/installer", run: "always", env: {
    "HOST_USER": user,
    "HOST_GROUP": group,
    "HOST_HOME": home,
    "HOST_UID": Process.uid,
    "HOST_GID": Process.gid,
    "HOST_SHELL": shell,
    "HOST_UNAME_S": uname_s,
  }
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

user = ENV["USER"]
group = `id -g -n`.chop
home = ENV["HOME"]
shell = ENV["SHELL"]
proxy = ENV["http_proxy"]
no_proxy = ENV["no_proxy"]
uname_s = `uname -s`.chop
oas_workspace = ENV["oas_workspace"]
vbox_memory = ENV["OAS_WORKSPACE_VBOX_MEMORY"] || 4096
libvirt_memory = ENV["OAS_WORKSPACE_LIBVIRT_MEMORY"] || 2048
vbox_cpus = ENV["OAS_WORKSPACE_VBOX_CPUS"] || 2
libvirt_cpus = ENV["OAS_WORKSPACE_LIBVIRT_CPUS"] || 1

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  if oas_workspace != "true"
    config.vm.hostname = "#{user}.192.168.12.37.xip.io"
    config.vm.network "private_network", ip: "192.168.12.37"
  else
    config.vm.hostname = "#{user}.192.168.13.37.xip.io"
    config.vm.network "private_network", ip: "192.168.13.37"
    config.vm.provider "libvirt" do |v|
      v.driver = "qemu"
    end
  end
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
  config.vm.provision "shell", path: "scripts/oasenvtool", run: "always", env: {
    "environment_name": "oas_workspace",
    "environment_value": "true",
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
    v.memory = vbox_memory.to_i
    v.cpus = vbox_cpus.to_i
  end
  config.vm.provider "libvirt" do |v|
    v.memory = libvirt_memory.to_i
    v.cpus = libvirt_cpus.to_i
  end
end

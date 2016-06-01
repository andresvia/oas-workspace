# -*- mode: ruby -*-
# vi: set ft=ruby :

proxy = "#{ENV["http_proxy"]}"

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "oasworkspace.192.168.12.37.xip.io"
  config.vm.network "private_network", ip: "192.168.12.37"
  config.vm.provision "file", source: "utils/oasenvtool", destination: "/tmp/oasenvtool"
  config.vm.provision "shell", inline: "sudo /tmp/oasenvtool -n http_proxy -v '#{proxy}'"
  config.vm.provision "shell", inline: "sudo /tmp/oasenvtool -n https_proxy -v '#{proxy}'"
  config.vm.provision "shell", inline: "rm -rfv /tmp/host_gnupg /tmp/oasenvtool"
  config.vm.provision "file", source: "#{ENV['HOME']}/.gnupg", destination: "/tmp/host_gnupg"
  config.vm.provision "file", source: "#{ENV['HOME']}/.ssh/id_rsa", destination: "/tmp/host_ssh_id_rsa"
  config.vm.provision "file", source: "#{ENV['HOME']}/.rpmmacros", destination: "/tmp/host_rpmmacros"
  config.vm.provision "shell", path: "installer.sh"
end

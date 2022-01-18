# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = 'centos/7'
  config.vm.provider :virtualbox

  config.vm.define 'docker_server' do |docker_server|
    docker_server.vm.disk :disk, size: '40GB', primary: true
  end

  config.vm.define 'general_server'
end

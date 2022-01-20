# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = 'generic/ubuntu1804'
  config.vm.provider :virtualbox

  config.vm.define 'docker_server' do |docker_server|
    docker_server.vm.disk :disk, size: '40GB', primary: true
    docker_server.vm.network :private_network, ip: '192.168.56.101'
  end

  config.vm.define 'general_server' do |general_server|
    general_server.vm.network :private_network, ip: '192.168.56.102'
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'src/ansible/playbooks/setup_docker.yml'
  end
end

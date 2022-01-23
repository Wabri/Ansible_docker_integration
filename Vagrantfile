# -*- mode: ruby -*-
# vi: set ft=ruby :

masters = [
  { :hostname => 'master-1', :ip => '192.168.56.101', :size => '40GB' }
]

workers = [
  { :hostname => 'workers-1', :ip => '192.168.56.201' }
]

Vagrant.configure('2') do |config|

  config.vm.box = 'generic/ubuntu1804'
  config.vm.provider :virtualbox

  masters.each do |master|
    config.vm.define master[:hostname] do |masterconfig|
      masterconfig.vm.disk :disk, size: master[:size], primary: true
      masterconfig.vm.network :private_network, ip: master[:ip]
    end
  end

  workers.each do |worker|
    config.vm.define worker[:hostname] do |workerconfig|
      workerconfig.vm.network :private_network, ip: worker[:ip]
    end
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'src/ansible/playbooks/setup_docker.yml'
  end
end

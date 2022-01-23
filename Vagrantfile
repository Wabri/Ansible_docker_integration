# -*- mode: ruby -*-
# vi: set ft=ruby :

masters = [
  { :hostname => 'master-1', :ip => '192.168.56.101', :sshport => '2222', :size => '40GB' }
]

workers = [
  { :hostname => 'worker-1', :ip => '192.168.56.201', :sshport => '2322', }
]

Vagrant.configure('2') do |config|

  config.vm.box = 'generic/ubuntu1804'
  config.vm.provider :virtualbox
  config.ssh.insert_key = false

  masters.each do |master|
    config.vm.define master[:hostname] do |masterconfig|
      masterconfig.vm.disk :disk, size: master[:size], primary: true
      masterconfig.vm.network :private_network, ip: master[:ip]
      masterconfig.vm.network :forwarded_port, guest: 22, host: master[:sshport], id: "ssh"
    end
  end

  workers.each do |worker|
    config.vm.define worker[:hostname] do |workerconfig|
      workerconfig.vm.network :private_network, ip: worker[:ip]
      workerconfig.vm.network :forwarded_port, guest: 22, host: worker[:sshport], id: "ssh"
    end
  end

end

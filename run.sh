vagrant destroy -f
vagrant up
sleep 3
ssh-keyscan -H 192.168.56.101 >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.56.201 >> ~/.ssh/known_hosts
ansible-playbook -i src/ansible/hosts/swarm_cluster src/ansible/playbooks/setup_docker.yml

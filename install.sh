#!/bin/bash

sudo add-apt-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
sudo sh -c "echo 'localhost ansible_connection=local' > /etc/localhosts"

exec ansible-playbook --ask-become-pass ./playbook.yml

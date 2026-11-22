#!/bin/bash

# Function to check if the previous command succeeded
check_command_success() {
    if [ $? -eq 0 ]; then
        echo "Success!"
    else
        echo "Error occurred. Exiting."
        exit 1
    fi
}

# Updating apt
sudo apt update
sudo apt upgrade -y

# Install Ansible from apt (pip installs into the system Python are blocked by PEP 668).
# The full "ansible" package includes community collections such as community.general.
echo "Installing Ansible..."
sudo apt install -y ansible
check_command_success

# Verify the installation
echo "Verifying Ansible installation..."
ansible --version
check_command_success

echo "Ansible installed successfully!"

# Run primary-wsl.yaml as root. Ubuntu 25.10+ ships sudo-rs, whose password prompt
# Ansible can't detect, so --ask-become-pass times out. As root, become needs no password.
sudo ansible-playbook primary-wsl.yaml

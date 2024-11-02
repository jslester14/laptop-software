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

# # Updating apt
sudo apt update
sudo apt upgrade -y

# # Ensure Python and pip are installed
# echo "Checking for Python and pip..."

# # Install Python if not installed
# if ! command -v python3 &> /dev/null; then
#     echo "Python3 is not installed. Installing Python3..."
#     sudo apt update && sudo apt install -y python3 python3-pip || sudo yum install -y python3 python3-pip || sudo dnf install -y python3 python3-pip
#     check_command_success
# else
#     echo "Python3 is already installed."
# fi

# # Ensure pip is installed
# if ! command -v pip3 &> /dev/null; then
#     echo "pip3 is not installed. Installing pip3..."
#     sudo apt install -y python3-pip || sudo yum install -y python3-pip || sudo dnf install -y python3-pip
#     check_command_success
# else
#     echo "pip3 is already installed."
# fi

# # # Upgrade pip
# # echo "Upgrading pip..."
# # python3 -m pip install --upgrade pip
# # check_command_success

# Install Ansible using pip
echo "Installing Ansible using pip..."
pip3 install ansible
check_command_success

# Add to PATH
printf '\nexport PATH="$PATH:/home/jlester/.local/bin"\n' >> ~/.bashrc
source ~/.bashrc

# Verify the installation
echo "Verifying Ansible installation..."
ansible --version
check_command_success

echo "Ansible installed successfully using pip!"

# Run primary-wsl.yaml
ansible-playbook primary-wsl.yaml --ask-become-pass

#!/bin/bash

export LC_ALL=C
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install base soft
#sudo apt-get install python-minimal -y
sudo apt-get install -y unzip git-core vim curl wget build-essential zip

sudo apt install maven

# Ansible
sudo apt-get install -y ansible python-pip python3-pip
pip3 install boto boto3

# Install docker and docker compose
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli
sudo usermod -aG docker `whoami`
sudo systemctl enable docker
sudo systemctl start docker
echo "Docker installed..."

sudo curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "docker-compose installed..."


# Install Terraform
wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
wget https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip

unzip terraform_0.11.14_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform11

unzip terraform_0.12.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform12

unzip packer_1.4.2_linux_amd64.zip
sudo mv packer /usr/local/bin/packer

terraform11 -version
terraform12 -version
packer --version

# Install awscli and SAM for serverless applications
pip3 install awscli aws-sam-cli --upgrade --user
pip3 install pytest pytest-mock --user
pip3 install cfn-lint

#nodejs, npm and aws-cdk
#install nodejs version >= 10 with npm
#npm install -g aws-cdk
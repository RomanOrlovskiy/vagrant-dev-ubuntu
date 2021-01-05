#!/bin/bash

export LC_ALL=C
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install base soft
#sudo apt-get install python-minimal -y
sudo apt-get install -y unzip git-core vim curl wget build-essential zip jq

# sudo apt install openjdk-8-jdk -y
# sudo apt install maven -y

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

sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "docker-compose installed..."

# Install Terraform
# wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
# wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
# wget https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip
#
# unzip terraform_0.11.14_linux_amd64.zip
# sudo mv terraform /usr/local/bin/terraform11
#
# unzip terraform_0.12.3_linux_amd64.zip
# sudo mv terraform /usr/local/bin/terraform12
#
# unzip packer_1.4.2_linux_amd64.zip
# sudo mv packer /usr/local/bin/packer

# terraform11 -version
# terraform12 -version
# packer --version

# Install awscli and SAM for serverless applications. This did not work for some reason
pip3 install awscli aws-sam-cli --upgrade --user
pip3 install pytest pytest-mock --user
pip3 install cfn-lint

# Fixes issue with pip when using private external urls like BAMS
sudo -H pip3 install --upgrade pip

#nodejs, npm and aws-cdk
#install nodejs version >= 10 with npm
#npm install -g aws-cdk

#resolve issue with git status on a VM through Windows
git config --global core.filemode false
git config --global core.autocrlf true

# git config --global user.email "roman.orlovskyi@thomsonreuters.com"
git config --global user.name "Roman Orlovskyi"

#generate SSH key

#TODO: configure SSH keys usage for different git servers (copy from ~/.ssh/config)

# install pulumi
# curl -fsSL https://get.pulumi.com | sh

# Install powershell 7 for REFI AWS access

# # Update the list of packages
# sudo apt-get update
# # Install pre-requisite packages.
# sudo apt-get install -y wget apt-transport-https
# # Download the Microsoft repository GPG keys
# wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# # Register the Microsoft repository GPG keys
# sudo dpkg -i packages-microsoft-prod.deb
# # Update the list of products
# sudo apt-get update
# # Enable the "universe" repositories
# sudo add-apt-repository universe
# # Install PowerShell
# sudo apt-get install -y powershell
# # Start PowerShell
# pwsh

### Kubernetes stuff

# minikube and kubectl
cd /tmp && curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb && sudo  dpkg -i minikube_latest_amd64.deb
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# auto completion
sudo kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl
source ~/.bashrc

# helm 3
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# TODO: helm 2 installation (if required)

# # kontena lens
# sudo apt install libgtk-3-0
# sudo snap install kontena-lens --classic
#
# # aws-iam-authenticator
# curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator
# chmod +x ./aws-iam-authenticator
# sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
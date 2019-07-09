Vagrant.configure(2) do |config|

    config.vm.define "ubuntu1804" do |ubuntu1804|
    
    ubuntu1804.vm.box = "ubuntu/bionic64"
    ubuntu1804.vm.hostname = "ubuntu18.com"
    ubuntu1804.vm.network "private_network", ip: "192.168.10.10"
    ubuntu1804.vm.synced_folder "~/Documents/projects", "/vagrant_data"
    ubuntu1804.vm.synced_folder "~/.ssh/keys", "/home/vagrant/.ssh/keys"
    ubuntu1804.disksize.size = '30GB'
        
    ubuntu1804.vm.provider "virtualbox" do |vb|
      vb.memory = 4048
      vb.cpus = 2
    end

    ubuntu1804.vm.provision "shell", path: "provision/development-env.sh"

  end

end
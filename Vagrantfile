Vagrant.configure(2) do |config|

    config.vm.define "ubuntu1804" do |ubuntu1804|
    
    ubuntu1804.vm.box = "ubuntu/bionic64"
    ubuntu1804.vm.hostname = "ubuntu18.com"
    ubuntu1804.vm.network "private_network", ip: "192.168.10.10"
    ubuntu1804.vm.network :forwarded_port, guest: 9443, host: 19443
    ubuntu1804.vm.network :forwarded_port, guest: 443, host: 10443
    ubuntu1804.vm.network :forwarded_port, guest: 80, host: 10080
    ubuntu1804.vm.network :forwarded_port, guest: 8080, host: 18080
    ubuntu1804.vm.synced_folder "C:/Users/roman_orlovskyi/Documents/projects", "/vagrant_data", :mount_options => ['dmode=0755', 'fmode=0774']
    ubuntu1804.vm.synced_folder "~/.ssh/keys", "/home/vagrant/.ssh/keys"
    ubuntu1804.disksize.size = '30GB'
        
    ubuntu1804.vm.provider "virtualbox" do |vb|
      vb.memory = 4048
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
    end

    ubuntu1804.vm.provision "shell", path: "provision/development-env.sh"

  end

end
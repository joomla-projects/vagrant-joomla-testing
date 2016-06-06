VAGRANTFILE_API_VERSION = "2"

  Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    hostname = "joomlatesting.box"
    locale = "en_GB.UTF-8"

    # use the default ubuntu 64bit image
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.gui = true
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    # enable private access to the machine via a static ip address
    config.vm.network "private_network", ip: "10.42.0.2"
    config.vm.network :forwarded_port, guest: 80, host: 4242

    # disable the default shared folder
    config.vm.synced_folder ".", "/vagrant", :disabled => true
    config.vm.synced_folder "./joomla", "/joomla"

    # update package list, install some packages & build custom docker image
    config.vm.provision :shell, :path => "vagrant-bootstrap.sh"
  end

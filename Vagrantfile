Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "192.170.56.102"
    config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
	v.name = "wraith-vm"
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]

  end

  
  config.vm.synced_folder "share", "/usr/local/apps", id: "vagrant-root" 
  config.vm.provision :shell, :inline => "sudo apt-get update"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end
end
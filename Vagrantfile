# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  
  config.vm.hostname = 'droneio'

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-14.04"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: '192.168.33.33'
  config.vm.network :forwarded_port, host: 40080, guest: 80

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Set the version of chef to install using the vagrant-omnibus plugin
  #config.omnibus.chef_version = :latest
  #config.omnibus.chef_version = '11.10'

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, type: "dhcp"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.

  # VirtualBox
  config.vm.provider :virtualbox do |vb, override|
    # Don't boot with headless mode
    #vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  # Sakura no Cloud Provider
  config.vm.provider :sakura do |sakura, override|
    sakura.access_token = "#{ENV['SAKURA_ACCESS_TOKEN']}"
    sakura.access_token_secret = "#{ENV['SAKURA_ACCESS_TOKEN_SECRET']}"
    sakura.sshkey_id = "#{ENV['SAKURA_SSHKEY_ID']}"
    sakura.disk_source_archive = '112600321612'  # Ubuntu Server 14.04 LTS 64bit
    sakura.server_name = 'droneio-symfony10'
    sakura.server_plan = '4004'  # Server Plan/4Core-4GB. You can see the other options with the command 'vagrant sakura-list-id'
    sakura.zone_id = 'is1a' # DO NOT CHANGE! Only is1a for free-use

    override.vm.box = 'dummy'
    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = File.expand_path "#{ENV['SAKURA_PRIVATE_KEY_PATH']}"
    override.omnibus.chef_version = '11.10' # Use omnibus
  end

  # Provisioning!
  # Chef
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'berks-cookbooks'
    #chef.roles_path = 'roles'

    chef.json = {
    }

    chef.add_recipe 'docker-drone-ubuntu14.04'

  end
end

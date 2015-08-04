# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # http://fgrehm.viewdocs.io/vagrant-cachier
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  else
    puts "Run 'vagrant plugin install vagrant-cachier' to speed up provisioning."
  end

  config.vm.hostname = "dspace"
  config.vm.box      = "ubuntu/trusty32"
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "private_network", ip: "192.168.50.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
#    vb.gui = true
  end

 if ENV['DSPACE_SYNC_REPO']
    config.vm.synced_folder ENV['DSPACE_SYNC_REPO'], "/srv/dspace-src", type: "nfs"

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "site.yml"
      ansible.host_key_checking = true
      ansible.extra_vars = { ansible_ssh_user: "vagrant", testing: true }
      ansible.verbose = "vvvv"
    end
 else
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "site.yml"
      ansible.host_key_checking = true
      ansible.extra_vars = { ansible_ssh_user: "vagrant", testing: true }
      ansible.verbose = "vvvv"
    end
 end

 if ENV['INSTALL_DSPACE']
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "install_dspace.yml"
    end
 end

  # config.vm.provision :ansible do |ansible|
  #   ansible.playbook = "site.yml"
  #   ansible.host_key_checking = true
  #   ansible.extra_vars = { ansible_ssh_user: "vagrant", testing: true }
  #   ansible.verbose = "vvvv"
  # end

  config.vm.post_up_message = "Welcome to your testing DSpace VM"

end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define :etcd0 do | etcd |
    etcd.vm.hostname = "etcd0"
    etcd.vm.network :private_network, ip: "192.168.33.200"#, virtualbox__intnet: "intnet"
    etcd.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

  config.vm.define :etcd1 do | etcd |
    etcd.vm.hostname = "etcd1"
    etcd.vm.network :private_network, ip: "192.168.33.201"#, virtualbox__intnet: "intnet"
    etcd.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

  config.vm.define :etcd2 do | etcd |
    etcd.vm.hostname = "etcd2"
    etcd.vm.network :private_network, ip: "192.168.33.202"#, virtualbox__intnet: "intnet"
    etcd.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end
end

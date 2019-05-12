VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define :n do | n |
    n.vm.hostname = "etcd0"
    n.vm.network :private_network, ip: "192.168.33.200"#, virtualbox__intnet: "intnet"
    n.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

end

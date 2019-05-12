VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define :etcd do | etcd |
    etcd.vm.hostname = "etcd0"
    etcd.vm.network :private_network, ip: "192.168.33.200"#, virtualbox__intnet: "intnet"
    etcd.vm.provision :shell, :path => "./init.sh",:privileged   => true
  end

end

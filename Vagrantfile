Vagrant.configure("2") do |config|
  config.vm.box = "fza/trusty64"

  config.vm.provision "shell" do |s|
    s.path = "shell/provision.sh" 
  end
end

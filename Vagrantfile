# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
 # "master"   => {"memory" => "2048", "cpu" => "2", "ip" => "100", "image" => "ubuntu/bionic64"},
  "node01"   => {"memory" => "2048", "cpu" => "2", "ip" => "110", "image" => "ubuntu/bionic64"},
  "node02"   => {"memory" => "2048", "cpu" => "2", "ip" => "120", "image" => "ubuntu/bionic64"},
  "node03"   => {"memory" => "2048", "cpu" => "2", "ip" => "130", "image" => "ubuntu/bionic64"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.linuxtips"
      machine.vm.network "private_network", ip: "10.20.20.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/Desc-K8S"]
      end
      machine.vm.provision "shell", path: "Scripts/provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.linuxtips"
    end
  end
end
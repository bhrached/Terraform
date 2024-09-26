terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}


provider "virtualbox" {
   delay      = 60
   mintimeout = 10
}


resource "virtualbox_vm" "node" {
  count = 1
  name  = "${ format("node-%02d", count.index + 1)}"
  #image  = "https://app.vagrantup.com/alpine/boxes/alpine64/versions/3.7.0/providers/virtualbox/unknown/vagrant.box"
  #image  = "/local/path/image.box"
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "2048 mib"
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "bridged"
    #device         = "IntelPro1000MTDesktop"
    #host_interface = "enp0s3"//enp0s8
    #host_interface = "enp0s3"//enp0s8
    # On Windows use this instead
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

resource "null_resource" "ssh_docker" {
  # Other resource settings  
  connection {
    type        = "ssh"
    user        = "vagrant"
    password = "vagrant"
    #private_key = file("/path/to/your/private/key.pem")
    host        = virtualbox_vm.node[0].network_adapter[0].ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World'",
      #"sudo apt-get update",
      #"sudo apt-get install ca-certificates curl gnupg"
    ]
  }

}


output "IPAddress" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

# output "IPAddress" {
#   value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
# }

/*terraform {
required_providers {
virtualbox = {
source = "terra-farm/virtualbox"
version = "0.2.2-alpha.1"
}
}
}
resource "virtualbox_vm" "node" {
name = "skyneds"
image = "https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box"
cpus = 1
memory = "1024 mib"

  network_adapter {
    type = "nat"
    host_interface = "Intel(R) Wi-Fi 6 AX200 160MHz"
  }
}

/*terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"  # Tu peux vérifier la dernière version
    }
  }
}

provider "virtualbox" {
}

# There are currently no configuration options for the provider itself.

resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 1
  memory    = "64 mib"
  user_data = file("${path.module}/scripts/configure_network.sh")

  network_adapter {
    type = "nat"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

/*output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}*/

/*resource "virtualbox_vm" "ansible" {
  name   = "ansible-server"
  image  = var.vm_image
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    #type           = "hostonly"
    type           = "bridged"
    host_interface = var.host_interface
    #ipv4_address   = "192.168.33.10"  # Adresse IP statique
    #ipv4_netmask   = "255.255.255.0"resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}
  }

  provisioner "file" {
    source      = "configure_network.sh"
    destination = "/scripts/configure_network.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/configure_network.sh",
      "sudo /scripts/configure_network.sh ansible"
    ]
  }

}*/
/*
resource "virtualbox_vm" "jenkins" {
  name   = "jenkins-server"
  image  = var.vm_image
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    #type           = "hostonly"
    type           = "bridged"
    host_interface = var.host_interface
    #ipv4_address   = "192.168.33.11"  # Adresse IP statique
    #ipv4_netmask   = "255.255.255.0"
  }

  provisioner "file" {
    source      = "configure_network.sh"
    destination = "/scripts/configure_network.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/configure_network.sh",
      "sudo /scripts/configure_network.sh jenkins"
    ]
  }

}

resource "virtualbox_vm" "gitlab" {
  name   = "gitlab-server"
  image  = var.vm_image
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    #type           = "hostonly"
    type           = "bridged"
    host_interface = var.host_interface
    #ipv4_address   = "192.168.33.12s"  # Adresse IP statique
    #ipv4_netmask   = "255.255.255.0"
  }

  provisioner "file" {
    source      = "configure_network.sh"
    destination = "/scripts/configure_network.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/configure_network.sh",
      "sudo /scripts/configure_network.sh gitlab"
    ]
  }
}

resource "virtualbox_vm" "wordpress" {
  name   = "wordpress-server"
  image  = var.vm_image
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    #type           = "hostonly"
    type           = "bridged"
    host_interface = var.host_interface
    #ipv4_address   = "192.168.33.13"  # Adresse IP statique
    #ipv4_netmask   = "255.255.255.0"
  }

  provisioner "file" {
    source      = "configure_network.sh"
    destination = "/scripts/configure_network.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/configure_network.sh",
      "sudo /scripts/configure_network.sh wordpress"
    ]
  }
}
*/
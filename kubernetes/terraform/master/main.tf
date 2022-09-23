terraform {
  required_providers {
    #Set provider version that will be installed.
    #If use "~> 0.35" will be installed higher ver.
    yandex = "0.35"
  }
  required_version = "0.12.19"
}
#cloud connection id's:
provider "yandex" {
  version                  = "0.35"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
#instance-1 resource description section:
resource "yandex_compute_instance" "k8s-master" {
  count = var.counts
  name  = "k8s-master${count.index}"
  #add pubkey to user from local file:
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  labels = {
    tags = "master-node"
  }

  resources {
    core_fraction = 5
    cores         = 4
    memory        = 4
  }

  platform_id = "standard-v2"

  boot_disk {
    initialize_params {
      #packer builded image with docker:
      image_id = var.docker_image_id
    }
  }

  network_interface {
    #my ru-central1-a ID
    subnet_id = var.subnet_id
    nat       = true
  }
  #provisioners instance connection details:
  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
    provisioner "file" {
    source     = "../files/daemon.json"
    destination = "/tmp/daemon.json"
  }

    provisioner "file" {
    source     = "../files/copy-daemon.sh"
    destination = "/tmp/copy-daemon.sh"
  }

    provisioner "remote-exec" {
      inline = [
      "chmod +x /tmp/copy-daemon.sh",
      "sudo /tmp/copy-daemon.sh",
    ]
  }
    provisioner "file" {
    source     = "../files/calico.yaml"
    destination = "/tmp/calico.yaml"
  }
    provisioner "local-exec" {
    #command = "ansible-playbook -u ubuntu -i '${self.network_interface.0.nat_ip_address},' ../../ansible/playbooks/k8s-install.yml"
     command = "ansible-playbook -v -u ubuntu  ./playbooks/k8s-install.yml"
     working_dir = "../../ansible"
}
    provisioner "local-exec" {
    #command = "ansible-playbook -u ubuntu -i '${self.network_interface.0.nat_ip_address},' ../../ansible/playbooks/k8s-install.yml"
     command = "ansible-playbook -v -u ubuntu  ./playbooks/k8s-connect-workers.yml"
     working_dir = "../../ansible"
}
}

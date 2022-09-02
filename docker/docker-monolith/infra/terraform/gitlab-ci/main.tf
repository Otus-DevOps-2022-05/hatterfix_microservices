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
resource "yandex_compute_instance" "gitlab-ci" {
  count = var.counts
  name  = "gitlab-ci-base${count.index}"
  #add pubkey to user from local file:
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    core_fraction = 5
    cores         = 2
    memory        = 4
  }

  platform_id = "standard-v2"

  boot_disk {
    initialize_params {
      #packer builded image for gitlab-base:
      image_id = var.gitlab_image_id
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
    content     = templatefile("./files/docker-compose.yml.tmpl", { ext_ip = self.network_interface.0.nat_ip_address})
    destination = "/tmp/docker-compose.yml"
  }
    provisioner "local-exec" {
    command = "ansible-playbook -u ubuntu -i '${self.network_interface.0.nat_ip_address},' ../../ansible/playbooks/install-gitlab-ci-docker.yml"
}
}

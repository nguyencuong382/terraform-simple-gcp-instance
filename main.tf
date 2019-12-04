terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Dono"

    workspaces {
      name = "terraform-simple-gcp-instance"
    }
  }
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

provider "google" {
  credentials = var.credentials
  project = var.project_name
  region = var.region
  zone = var.region_zone
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-test-${random_id.instance_id.hex}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    ssh-keys = "nguyencuong:${var.public_key}"
  }

  tags = ["http-server", "https-server"]

  connection {
    host = google_compute_address.static.address
    type = "ssh"
    private_key = var.private_key
    user     = "nguyencuong"
    timeout  = "30s"
  }

  provisioner "file" {
    source      = "./entrypoint.sh"
    destination = "/tmp/entrypoint.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/entrypoint.sh",
      "/tmp/entrypoint.sh",
    ]
  }
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Dono"

    workspaces {
      name = "my-app-prod"
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
  credentials = file(var.credentials_fle_path)
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
    ssh-keys = "nguyencuong:${file("~/.ssh/gcc.pub")}"
  }

  tags = ["http-server", "https-server"]

  connection {
    host = google_compute_address.static.address
    type = "ssh"
    private_key = file("~/.ssh/gcc")
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

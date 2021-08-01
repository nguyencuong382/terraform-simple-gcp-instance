provider "google" {
  credentials = var.credentials
  project = var.project_name
  region = var.region
  zone = var.region_zone
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_address" "static" {
  name = "ipv4-address-vm-instance-terraform-${var.vm_name}"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform--${var.vm_name}-${random_id.instance_id.hex}"
  machine_type = var.machine_type
  allow_stopping_for_update = true

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
    ssh-keys = "${var.ssh_user_name}:${var.public_key}"
  }

  tags = ["http-server", "https-server", "postgres"]

  # connection {
  #   host = google_compute_address.static.address
  #   type = "ssh"
  #   private_key = var.private_key
  #   user     = var.ssh_user_name
  #   timeout  = "30s"
  #   agent    = false
  #   port     = 22
  # }

  # provisioner "file" {
  #   source      = "./entrypoint.sh"
  #   destination = "/tmp/entrypoint.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/entrypoint.sh",
  #     "/tmp/entrypoint.sh",
  #   ]
  # }
}

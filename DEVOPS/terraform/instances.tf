resource "google_compute_instance" "frontend_vm" {

  name         = "frontend-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["frontend"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id

    # Gives the VM a public IP
    access_config {}
  }

#   metadata = {
#     ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
#   }
}



resource "google_compute_instance" "backend_vm" {

  name         = "backend-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["backend"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.id
    # No access_config means no public IP

    # Gives the VM a public IP
    access_config {}
  }

  

#   metadata = {
#     ssh-keys = "user:${file("~/.ssh/id_rsa.pub")}"
#   }
}


resource "google_compute_instance" "mongodb_vm" {
  name         = "mongodb-vm"
  machine_type = "e2-small"  # Adjust based on needs
  zone         = "us-central1-a"

  tags = ["mongodb"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20  # GB
    }
  }

  network_interface {
    network    = google_compute_network.bertflix_vpc_network.id
    subnetwork = google_compute_subnetwork.private_subnet.id  # Put in private subnet!
    
    # No external IP for security (will need bastion host to access)

    # Gives the VM a public IP
    access_config {}
  }
}

output "frontend_vm_ip" {
  value = google_compute_instance.frontend_vm.network_interface[0].access_config[0].nat_ip
}

output "backend_vm_ip" {
  value = google_compute_instance.backend_vm.network_interface[0].access_config[0].nat_ip
}

output "mongodb_vm_ip" {
  value = google_compute_instance.mongodb_vm.network_interface[0].access_config[0].nat_ip
}

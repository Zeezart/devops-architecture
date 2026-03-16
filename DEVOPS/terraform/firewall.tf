resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.bertflix_vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  # Allow traffic from internet
  source_ranges = ["0.0.0.0/0"]

  target_tags = ["frontend"]
}

resource "google_compute_firewall" "allow_ssh" {

  name    = "allow-ssh"
  network = google_compute_network.bertflix_vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Allow SSH from anywhere (for now)
  source_ranges = ["102.89.47.117/32","0.0.0.0/0"]

  target_tags = ["frontend", "backend", "mongodb"]
}

resource "google_compute_firewall" "frontend_to_backend" {

  name    = "allow-frontend-backend"
  network = google_compute_network.bertflix_vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  # Only frontend subnet can call backend API
  source_ranges = ["10.0.1.0/24"]

  target_tags = ["backend"]
}


resource "google_compute_firewall" "allow_mongodb" {

  name    = "allow-mongodb"
  network = google_compute_network.bertflix_vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  # Only backend subnet can access MongoDB
  source_ranges = ["10.0.2.0/24"]

  target_tags = ["database"]
}

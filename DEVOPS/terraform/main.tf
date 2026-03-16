
# Create a custom VPC network
resource "google_compute_network" "bertflix_vpc_network" {
  name                    = "bertflix-vpc-network"
  auto_create_subnetworks = false # Set to false for manual subnet creation
  routing_mode            = "GLOBAL"
}

# Create a public subnetwork within the VPC
resource "google_compute_subnetwork" "public_subnet" {
  name          = "bertflix-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1" # Must be the same or within the provider's region
  network       = google_compute_network.bertflix_vpc_network.id
}

# Create a private subnetwork within the VPC (optional)
resource "google_compute_subnetwork" "private_subnet" {
  name                     = "bertflix-private-subnet"
  ip_cidr_range            = "10.0.2.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.bertflix_vpc_network.id
  private_ip_google_access = true # Allows instances in this subnet to access Google APIs privately
}



resource "google_artifact_registry_repository" "app_repo" {
  location      = "us-central1"
  repository_id = "bertflix-image"
  description   = "frontend and backend"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}

# Output the VPC and subnet details after creation
output "vpc_name" {
  value = google_compute_network.bertflix_vpc_network.name
}

output "public_subnet_id" {
  value = google_compute_subnetwork.public_subnet.id
}

output "private_subnet_id" {
  value = google_compute_subnetwork.private_subnet.id
}

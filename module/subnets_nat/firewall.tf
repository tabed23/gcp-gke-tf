/* # Firewall rule for SSH (port 22) in public subnets
resource "google_compute_firewall" "public_ssh" {
  name    = "${var.vpc_name}-public-ssh"
  network = var.vpc_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Firewall rule to allow all internal traffic in private subnets (no tags)
resource "google_compute_firewall" "private_internal" {
  name    = "${var.vpc_name}-private-internal"
  network = var.vpc_id

  allow {
    protocol = "all"  
  }

  source_ranges = ["10.0.0.0/8"] 
} */
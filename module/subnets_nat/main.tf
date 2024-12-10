# Create public subnets
resource "google_compute_subnetwork" "public_subnet" {
  for_each               = var.public_subnets
  name                   = "${each.key}-public"
  ip_cidr_range          = each.value.cidr_block
  region                 = each.value.region
  network                = var.vpc_name
}

# Create private subnets
resource "google_compute_subnetwork" "private_subnet" {
  for_each               = var.private_subnets
  name                   = "${each.key}-private"
  ip_cidr_range          = each.value.cidr_block
  region                 = each.value.region
  network                = var.vpc_name
  private_ip_google_access = true
}

# Cloud Router (for NAT)
resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router-${var.region}" 
  network = var.vpc_name
  region  = var.region
}

# Cloud NAT for private subnets
resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc_name}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

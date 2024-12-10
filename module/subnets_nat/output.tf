# Output the subnet name for GKE
output "private_subnet" {
  value = google_compute_subnetwork.private_subnet["private-1"].name
}
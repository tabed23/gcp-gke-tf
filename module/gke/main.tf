resource "google_container_cluster" "gke_cluster" {
  name     = "${var.cluster_name}-${var.region}"
  location = var.region

  enable_autopilot = true

  network    = var.network
  subnetwork = var.subnetwork 

  private_cluster_config {
    enable_private_nodes = true  
    master_ipv4_cidr_block = var.gke_ipv4_cidr 
  }


  # Enable logging and monitoring
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

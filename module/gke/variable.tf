variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be created"
  type        = string
}

variable "network" {
  description = "VPC network name where GKE cluster will be deployed"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name where GKE cluster will be deployed"
  type        = string
}


variable "gke_ipv4_cidr" {}

variable "service_account_email" {}
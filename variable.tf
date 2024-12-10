variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnets_us_east1" {
  description = "Public subnets for us-east1"
  type = map(object({
    cidr_block = string
    region     = string
  }))
}

variable "private_subnets_us_east1" {
  description = "Private subnets for us-east1"
  type = map(object({
    cidr_block = string
    region     = string
  }))
}


variable "default_region" {
  description = "The default region for the provider"
  type        = string
  default     = "us-east1"
}


#----------------GKE--------------


variable "cluster_name" {}

variable "gke_ipv4_cidr" {}



#--------- KMS & ARTIFACT REGISTORY ----------

variable "artifact_repo_name" {
  description = "Name of the Artifact Registry repository"
  type        = string
}

variable "kms_keyring_name" {
  description = "Name of the KMS keyring"
  type        = string
}

variable "kms_key_name" {
  description = "Name of the KMS key"
  type        = string
}

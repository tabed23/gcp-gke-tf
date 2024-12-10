terraform {
  backend "gcs" {
    bucket = ""
    prefix = "terraform/state"
  }
}

module "vpc" {
  source   = "./module/vpc"
  vpc_name = var.vpc_name
}

module "subnets_nat_us_east1" {
  source          = "./module/subnets_nat"
  vpc_name        = module.vpc.vpc_name
  vpc_id          = module.vpc.vpc_id
  region          = "us-east1"
  public_subnets  = var.public_subnets_us_east1
  private_subnets = var.private_subnets_us_east1
}


module "gke_service_account" {
  source                       = "./module/service_account"
  project_id                   = var.project_id
  service_account_id           = "gke-service-account"
  service_account_display_name = "GKE Service Account"
}

module "artifact_kms" {
  source             = "./module/artifact_kms"
  project_id         = var.project_id
  region             = var.default_region
  artifact_repo_name = var.artifact_repo_name
  kms_keyring_name   = var.kms_keyring_name
  kms_key_name       = var.kms_key_name
}

module "gke" {
  source                = "./module/gke"
  cluster_name          = var.cluster_name
  region                = "us-east1"
  gke_ipv4_cidr         = var.gke_ipv4_cidr
  service_account_email = module.gke_service_account.gke_sa_email
  network               = module.vpc.vpc_name
  subnetwork            = module.subnets_nat_us_east1.private_subnet
}

module "cloud_logging" {
  source     = "./module/cloudlogs"
  project_id = var.project_id
}


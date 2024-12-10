variable "artifact_repo_name" {
  description = "The ID of the artifact repository"
  type        = string
}

variable "kms_keyring_name" {
  description = "The name of the KMS key ring"
  type        = string
}

variable "kms_key_name" {
  description = "The name of the KMS crypto key"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
}

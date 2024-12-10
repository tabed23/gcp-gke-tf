variable "service_account_id" {
  description = "The ID of the GKE service account"
  type        = string
}

variable "service_account_display_name" {
  description = "Display name of the GKE service account"
  type        = string
  default     = "GKE Service Account"
}

variable "project_id" {}
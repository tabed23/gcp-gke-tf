# Enable the Cloud Logging API
resource "google_project_service" "logging_api" {
  project = var.project_id
  service = "logging.googleapis.com"
}

resource "google_project_iam_audit_config" "all-services" {
  project = var.project_id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
}
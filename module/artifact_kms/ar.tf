# Enable the Artifact Registry API
resource "google_project_service" "artifact_registry_api" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "artifact_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = var.artifact_repo_name
  description   = "Artifact Registry for storing container images"
  format        = "DOCKER"

  kms_key_name = google_kms_crypto_key.gke_crypto_key.id
}


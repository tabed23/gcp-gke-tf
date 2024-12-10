data "google_project" "project" {
  project_id = var.project_id
}

resource "google_kms_crypto_key_iam_member" "artifact_registry_kms_access" {
  crypto_key_id = google_kms_crypto_key.gke_crypto_key.id # Reference the KMS key created earlier
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  member = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-artifactregistry.iam.gserviceaccount.com"
}
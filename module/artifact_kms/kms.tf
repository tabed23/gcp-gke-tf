# Enable the Cloud KMS API
resource "google_project_service" "kms_api" {
  project = var.project_id
  service = "cloudkms.googleapis.com"
}

# Create a KMS Keyring
resource "google_kms_key_ring" "gke_keyring" {
  name     = var.kms_keyring_name
  project  = var.project_id
  location = var.region
}

# Create a KMS Crypto Key for encryption
resource "google_kms_crypto_key" "gke_crypto_key" {
  name     = var.kms_key_name
  key_ring = google_kms_key_ring.gke_keyring.id
  purpose  = "ENCRYPT_DECRYPT"
}
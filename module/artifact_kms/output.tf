# Output the repository URL
output "artifact_registry_url" {
  value = google_artifact_registry_repository.artifact_repo.repository_id
} 

output "kms_crypto_key_id" {
  description = "The ID of the KMS Crypto Key"
  value       = google_kms_crypto_key.gke_crypto_key.id
}

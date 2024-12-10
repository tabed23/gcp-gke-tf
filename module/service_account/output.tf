output "gke_sa_email" {
  description = "The email of the GKE service account"
  value       = google_service_account.gke_sa.email
}
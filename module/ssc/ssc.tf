/* resource "google_project_service" "security_center_api" {
  project = var.project_id
  service = "securitycenter.googleapis.com"
}


resource "google_scc_source" "custom_source" {
  display_name = "My Source"
  organization = var.project_id
  description  = "custom Cloud Security Command Center Finding Source"
}
 */
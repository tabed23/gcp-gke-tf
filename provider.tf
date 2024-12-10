provider "google" {
  project     = "{project id}"
  region      = "us-east1"
  credentials = file("credentials.json")
}

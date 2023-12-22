provider "google" {
  credentials = file("./uaedataloop-service-account.json")
  project     = var.project_id
  region      = var.location
}

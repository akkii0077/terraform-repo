provider "google" {
  credentials = file("./uae-xyz-07f75acbacff.json")
  project     = var.project_id
  region      = var.location
}

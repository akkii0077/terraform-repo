resource "google_compute_network" "network" {
  name                            = var.network_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  project                         = var.project_id
  routing_mode                    = var.routing_mode
}

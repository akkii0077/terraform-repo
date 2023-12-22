module "vpcnetwork" {
  source = "../../../modules/vpcnetwork"

  network_name            = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project_id              = var.project_id
}

module "gke" {
  source = "../../../modules/gke"

  project_id     = var.project_id
  machine_type   = var.machine_type
  location       = var.zone
  node_disk_size = var.node_disk_size
  cluster_name   = var.cluster_name
  network        = module.vpcnetwork.self_link
  subnetwork     = var.subnetwork
  zone           = var.zone
  sa             = var.sa


  depends_on = [module.vpcnetwork]

}

resource "google_container_cluster" "gke" {
  name = var.cluster_name

  location = var.location
  project  = var.project_id

  #networking_mode = "VPC_NATIVE"
  network         = var.network
#  subnetwork      = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 2
  deletion_protection      = false
  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {}

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_container_node_pool" "general" {
  name       = "${var.cluster_name}-nodes"
  location   = var.location
  cluster    = google_container_cluster.gke.name
  project    = var.project_id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
    }
    machine_type = var.machine_type
    disk_size_gb = var.node_disk_size
    service_account = "${var.sa}@${var.project_id}.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }


  autoscaling {
    min_node_count = 1
    max_node_count = 6
  }
}

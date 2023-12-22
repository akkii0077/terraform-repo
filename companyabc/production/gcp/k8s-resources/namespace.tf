terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.52.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

data "terraform_remote_state" "gke" {
  backend = "local"

  config = {
    path = "../.terraform/terraform.tfstate"
  }
}

provider "google" {
  project = "uaedataloop"
  region  = "asia-south2"
}

data "google_client_config" "default" {
  credentials = file("../uaedataloop-service-account.json")
}

data "google_container_cluster" "gke_cluster" {
  name     = "uaedataloop-gke-cluster"
  location = "asia-south2-a"
}

provider "kubernetes" {
  host = data.terraform_remote_state.gke.outputs.kubernetes_cluster_host

  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "services" {
  metadata {
    name = "services"
  }
}

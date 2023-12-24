resource "kubernetes_namespace" "services" {
  metadata {
    name = "services"
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Update with the path to your kubeconfig file
  }
}

resource "helm_release" "nginx" {
  name       = "my-nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  namespace  = "services"

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.ports.http"
    value = "80"
  }

  set {
    name  = "controller.replicaCount"
    value = "1"
  }
}


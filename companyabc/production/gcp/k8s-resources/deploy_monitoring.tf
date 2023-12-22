resource "kubernetes_deployment" "prometheus" {
  metadata {
    name = "prometheus"
    labels = {
      name = "prometheus"
    }
    namespace = "monitoring"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "prometheus"
      }
    }
    strategy {
      rolling_update {
        max_surge = 1
        max_unavailable = 1
      }
      type = "RollingUpdate"
    }
    template {
      metadata {
        labels = {
          name = "prometheus"
        }
      }
      spec {
        container {
          image = "prom/prometheus:latest"
          image_pull_policy = "IfNotPresent"
          name = "prometheus"

          port {
            container_port = 9090
            protocol = "TCP"
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          volume_mount {
            name = "data"
            mount_path = "/prometheus"
            read_only = false
          }
        }
        security_context {}
        volume {
          name = "data"
          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
    labels = {
      name = "grafana"
    }
    namespace = "monitoring"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "grafana"
      }
    }
    strategy {
      rolling_update {
        max_surge = 1
        max_unavailable = 1
      }
      type = "RollingUpdate"
    }
    template {
      metadata {
        labels = {
          name = "grafana"
        }
      }
      spec {
        container {
          image = "grafana/grafana:latest"
          image_pull_policy = "IfNotPresent"
          name = "grafana"

          port {
            container_port = 3000
            protocol = "TCP"
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "1024Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
          volume_mount {
            name = "data"
            mount_path = "/var/lib/grafana"
          }
        }
        security_context {}
        volume {
          name = "data"
          empty_dir {}
        }
      }
    }
  }
}

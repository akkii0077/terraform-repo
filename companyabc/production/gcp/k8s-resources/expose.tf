resource "kubernetes_service" "grafana_service" {
  metadata {
    name = "grafana"
    namespace = "monitoring"
  }
  spec {
    selector = {
      name = "grafana"
    }
    port {
      port = 80
      protocol = "TCP"
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}

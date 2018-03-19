variable "deployment_type" {
  type = "string"
}

resource "kubernetes_replication_controller" "fluentd" {
  metadata {
    name = "fluentd"
    labels {
      App = "fluentd"
    }
  }

  spec {
    replicas = 1
    selector {
      App = "fluentd"
    }
    template {
      container {
        image = "fluent/fluentd"
        name  = "fluentd"

        port {
          container_port = 24224
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "fluentd" {
  metadata {
    name = "fluentd"
  }
  spec {
    selector {
      App = "${kubernetes_replication_controller.fluentd.metadata.0.labels.App}"
    }
    port {
      port = 24224
      target_port = 24224
      node_port = 30224
    }

    type = "${ var.deployment_type == "local" ? "NodePort" : "LoadBalancer" }"
  }
}
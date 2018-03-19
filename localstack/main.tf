variable "deployment_type" {
  type = "string"
}

# resource "kubernetes_pod" "elasticsearch" {
#   count = "${var.deployment_type == "local" ? 1 : 0}"
#   metadata {
#     name = "elasticsearch"
#     labels {
#       App = "elasticsearch"
#     }
#   }
#
#   spec {
#     container {
#       image = "docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.2"
#       name  = "elasticsearch"
#
#       port {
#         container_port = 9200
#       }
#
#       port {
#         container_port = 9300
#       }
#
#       resources {
#         limits {
#           cpu    = "0.5"
#           memory = "512Mi"
#         }
#         requests {
#           cpu    = "250m"
#           memory = "256Mi"
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "elasticsearch" {
#   count = "${var.deployment_type == "local" ? 1 : 0}"
#   metadata {
#     name = "elasticsearch"
#   }
#   spec {
#     selector {
#       App = "${kubernetes_pod.elasticsearch.metadata.0.labels.App}"
#     }
#
#     port {
#       name = "es-port1"
#       port = 9200
#       node_port=30920
#       target_port = 9200
#     }
#
#     port {
#       name = "es-port2"
#       port = 9300
#       node_port=30930
#       target_port = 9300
#     }
#
#     type = "NodePort"
#   }
# }

resource "kubernetes_pod" "kibana" {
  count = "${var.deployment_type == "local" ? 1 : 0}"
  metadata {
    name = "kibana"
    labels {
      App = "kibana"
    }
  }

  spec {
    container {
      image = "docker.elastic.co/kibana/kibana-oss:6.2.2"
      name  = "kibana"

      port {
        container_port = 5601
      }
    }
  }
}

resource "kubernetes_service" "kibana" {
  count = "${var.deployment_type == "local" ? 1 : 0}"
  metadata {
    name = "kibana"
  }
  spec {
    selector {
      App = "${kubernetes_pod.kibana.metadata.0.labels.App}"
    }

    port {
      port = 5601
      node_port=30601
      target_port = 5601
    }

    type = "NodePort"
  }
}
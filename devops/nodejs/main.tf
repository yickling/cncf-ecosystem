provider "kubernetes" {
  host     = "https://192.168.99.100:8443"
  username = "docker"
  password = "tcuser"
}

resource "kubernetes_pod" "nodejs_demo" {
  metadata {
    name = "nodejs-demo"
    labels {
      App = "nodejs-demo"
    }
  }

  spec {
    container {
      image = "nodejs-demo:1.0"
      name  = "nodejs-demo"

      port {
        name = "debug"
        container_port = 5858
      }

      port {
        name = "exposed"
        container_port = 8080
      }
    }
  }
}

resource "kubernetes_service" "nodejs_demo" {
  metadata {
    name = "nodejs-demo"
  }
  spec {
    selector {
      App = "${kubernetes_pod.nodejs_demo.metadata.0.labels.App}"
    }

    port {
      port = 8080
      node_port=30808
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_pod" "nodejs_legacy_demo" {
  metadata {
    name = "nodejs-legacy-demo"
    labels {
      App = "nodejs-legacy-demo"
    }
  }

  spec {
    container {
      image = "nodejs-legacy-demo:1.0"
      name  = "nodejs-legacy-demo"

      port {
        name = "debug"
        container_port = 5858
      }

      port {
        name = "exposed"
        container_port = 8080
      }
    }
  }
}

resource "kubernetes_service" "nodejs_legacy_demo" {
  metadata {
    name = "nodejs-legacy-demo"
  }
  spec {
    selector {
      App = "${kubernetes_pod.nodejs_legacy_demo.metadata.0.labels.App}"
    }

    port {
      port = 8080
      node_port=30809
      target_port = 8080
    }

    type = "NodePort"
  }
}
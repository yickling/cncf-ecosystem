provider "kubernetes" {
  host     = "https://192.168.99.100:8443"
  username = "docker"
  password = "tcuser"

  # client_certificate     = "${file("~/.minikube/apiserver.crt")}"
  # client_key             = "${file("~/.minikube/apiserver.key")}"
  # cluster_ca_certificate = "${file("~/.minikube/ca.pem")}"
}

module "fluentd" {
  source = "./fluentd"
  deployment_type = "${var.deployment_type}"
}

module "prometheus" {
  source = "./prometheus"
  # deployment_type = "${var.deployment_type}"
}

module "jaeger" {
  source = "./jaeger"
  # deployment_type = "${var.deployment_type}"
}

module "localstack" {
  source = "./localstack"
  deployment_type = "${var.deployment_type}"
}
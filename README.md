# cncf-ecosystem
An opinionated cloud infrastructure ecosystem based on CNCF projects, focusing on API connectivity

Cloud infrastructure:
* Terraform provisioning K8S nodes
* K8S container orchestration
* fluentd output into EFK logstack
* prometheus monitoring with grafana panel
* jaeger tracing with panel
* envoy infrastructure proxies
* Openstack Swift Object/blob storage
* Hashicorp vault secret storage

Dev infrastructure
* grpc + jaeger + prometheus wrapper for NodeJS, Golang
* drone.io for modern CI/CD build chain
* github automation
* custom docker registry

Functionality infrastructure
* WSO2 IAM service protection
* Kong API gateway protection
* Rook/Ceph for hybrid cloud management
* Certbot (LetsEncrypt)

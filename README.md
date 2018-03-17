# cncf-ecosystem
An opinionated cloud infrastructure ecosystem based on CNCF projects, focusing on API connectivity

Core Cloud infrastructure:
* Terraform provisioning (K8S nodes, DB servers)
* K8S container orchestration
* fluentd output into EFK logstack
* prometheus monitoring with grafana panel
* jaeger tracing with panel
* envoy infrastructure proxies
* Openstack Swift Object/blob storage
* Hashicorp vault secret storage

DevOps infrastructure
* grpc + jaeger + prometheus + IAM framework for NodeJS, Golang
* drone.io for modern CI/CD build chain
* sonarqube integration
* github integration
* private docker registry / Docker Hub / Amazon ECS

Functionality infrastructure
* WSO2 IAM SSO and SNS integration
* Kong API gateway protection
* Rook/Ceph for hybrid cloud storage

Target application residents
* Python based data processors
* NodeJS based web servers (Express/Loopback/Koa)
* C/C++ real-time applications
* Golang based applications

Target architectural residents
* AMQP compatible
* Redis
* Kafka
* Mulesoft
* Hadoop
* Spark

Target Databases
* MySQL/PostgreSQL
* MongoDB
* CouchDB
* ArangoDB

Collaboration features
* trello integration
* JIRA integration
* slack integration


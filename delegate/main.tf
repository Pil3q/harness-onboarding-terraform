module "k8s_connector" {
  source  = "../modules/connectors"
  project = var.PROJ
  cluster = var.CLUSTER
  organization = var.ORG
}

module "delegate_service" {
  source  = "../modules/services"
  project = var.PROJ
  organization = var.ORG
}

module "environment" {
  source  = "../modules/environments"
  project = var.PROJ
  organization = var.ORG
}
module "k8s_connector" {
  source  = "../modules/connectors"
  project = var.project
  cluster = var.cluster
  organization = var.organization
  
}

resource "random_string" "this" {
  length = 4
  special = false
  upper = false
  number = false
}
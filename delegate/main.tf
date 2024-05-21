module "k8s_connector" {
  source  = "../modules/connectors"
  project = var.PROJ
  cluster = var.CLUSTER
  organization = var.ORG
  
}

resource "random_string" "this" {
  length = 4
  special = false
  upper = false
  number = false
}
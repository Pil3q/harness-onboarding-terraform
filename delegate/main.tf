module "k8s_connector" {
  source  = "../modules/connectors"
  project = var.PROJ
  cluster = var.CLUSTER
  organization = var.ORG
}
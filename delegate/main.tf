module "k8s_connector" {
  source       = "../modules/connectors"
  project      = var.PROJ
  cluster      = var.CLUSTER
  organization = var.ORG
}

module "delegate_service" {
  source       = "../modules/services"
  project      = var.PROJ
  organization = var.ORG
  name         = "${var.name}_service"

}

module "environment" {
  source       = "../modules/environments"
  project      = var.PROJ
  organization = var.ORG
  name         = "${var.name}_environment"
}

module "infrastructure-definition" {
  source       = "../modules/infrastructure-definition"
  project      = var.PROJ
  organization = var.ORG
  env          = module.environment.id
  # Are you going to work? 
  connector = module.k8s_connector.id
}

module "pipeline" {
  source       = "../modules/pipelines"
  project      = var.PROJ
  organization = var.ORG
  name         = "${var.name}_pipeline"

}

# module "trigger" {
#   source       = "../modules/trigger"
#   project      = var.PROJ
#   organization = var.ORG
#   pipeline     = module.pipeline.id
#   name         = "${var.name}_trigger"
# }
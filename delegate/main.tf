module "k8s_connector" {
  source  = "../modules/connectors"
  name = var.team_name
  team_name = var.team_name
  organization_id = var.organization_id
  identifier = "var.identifier_${random_string.this.result}"
}

resource "random_string" "this" {
  length = 4
  special = false
  upper = false
  number = false
}
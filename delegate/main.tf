module "k8s_connector" {
  source  = "app.terraform.io/empire/modules/harness//modules/connectors/connector-kubernetes"
  version = "1.0.1"
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
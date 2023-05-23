locals {
  config_path            = "${path.module}/../../config"
  templates_config       = yamldecode(file("${local.config_path}/${var.team_name}/templates.yaml"))
}

data "harness_platform_organization" "this" {
  identifier = var.organization_id
}

data "harness_platform_project" "this" {
  name = "${var.team_name}"
  org_id = data.harness_platform_organization.this.id
}

resource "random_string" "this" {
  length = 4
  special = false
  upper = false
  number = false
}

module "canary_kubernetes" {
  for_each        = local.templates_config
  source          = "./canary-kubernetes"
  organization_id = data.harness_platform_organization.this.id
  team_name       = var.team_name
  name            = each.key
  type            = each.value.type
}
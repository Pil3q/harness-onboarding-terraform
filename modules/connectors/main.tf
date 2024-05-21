/*
locals {
  config_path            = "${path.module}/../../../config"
  global_config          = yamldecode(file("${var.config_path}/values.yaml"))
  team_config            = yamldecode(file("${var.config_path}/${var.team_name}/values.yaml"))
  service_config         = yamldecode(file("${var.config_path}/${var.team_name}/services.yaml"))
  var_types = {
    "text" : "TEXT",
    "secret" : "ENCRYPTED_TEXT",
  }
}
*/

data "harness_platform_organization" "this" {
  identifier = var.organization
}

data "harness_platform_project" "this" {
  name = "${var.project}"
  org_id = data.harness_platform_organization.this.id
}

resource "harness_platform_connector_kubernetes" "this" {
  identifier  = var.cluster
  name        = var.cluster

  inherit_from_delegate {
    delegate_selectors = ["${var.cluster}"]
  }
}
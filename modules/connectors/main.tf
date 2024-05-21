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
resource "harness_platform_connector_kubernetes" "this" {
  identifier  = var.cluster
  name        = var.cluster
  org_id      = var.organization
  project_id  = var.project


  inherit_from_delegate {
    delegate_selectors = ["${var.cluster}"]
  }
}
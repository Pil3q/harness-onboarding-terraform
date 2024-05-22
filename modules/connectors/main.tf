
resource "harness_platform_connector_kubernetes" "this" {
  identifier = var.cluster
  name       = var.cluster
  org_id     = var.organization
  project_id = var.project


  inherit_from_delegate {
    delegate_selectors = ["${var.cluster}"]
  }
}
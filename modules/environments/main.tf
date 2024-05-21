resource "harness_platform_environment" "this" {
  org_id       = var.organization
  project_id   = var.project
  name         = var.name
  identifier   = var.name
  type         = var.type
}
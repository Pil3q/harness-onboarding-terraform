resource "harness_platform_infrastructure" "this" {
  org_id          = var.organization
  name            = var.name
  identifier      = var.name
  env_id          = var.env
  type            = var.type
  deployment_type = var.deployment_type
  project_id      = var.project

  yaml = <<-EOT
infrastructureDefinition:
  name: ${var.name}
  identifier: ${var.name}
  description: ""
  tags: {}
  orgIdentifier: ${var.organization}
  environmentRef: ${var.env}
  deploymentType: ${var.deployment_type}
  type: ${var.type}
  spec:
    connectorRef: ${var.connector}
    namespace: ${var.namespace}
    releaseName: release-<+INFRA_KEY>
  allowSimultaneousDeployments: false
EOT
}
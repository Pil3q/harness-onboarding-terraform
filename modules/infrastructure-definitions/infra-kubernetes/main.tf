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

resource "harness_platform_infrastructure" "this" {
  org_id          = data.harness_platform_organization.this.id
  project_id      = data.harness_platform_project.this.id
  name            = var.name
  identifier      = "${var.name}_${random_string.this.result}"
  env_id          = var.env
  type            = var.type == "Kubernetes" ? "KubernetesDirect" : var.type
  deployment_type = var.type

  yaml            =  <<-EOT
infrastructureDefinition:
  name: ${var.name}
  identifier: ${var.name}_${random_string.this.result}
  description: ""
  tags: {}
  orgIdentifier: ${data.harness_platform_organization.this.id}
  projectIdentifier: ${data.harness_platform_project.this.id}
  environmentRef: ${var.env}
  deploymentType: ${var.type}
  type: ${var.type == "Kubernetes" ? "KubernetesDirect" : var.type}
  spec:
    connectorRef: account.${var.connector}
    namespace: ${var.namespace}
    releaseName: release-<+INFRA_KEY>
  allowSimultaneousDeployments: false
EOT
}
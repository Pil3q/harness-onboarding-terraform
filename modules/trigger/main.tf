resource "harness_platform_triggers" "this" {
  identifier = var.name
  org_id     = var.organization
  project_id = var.project
  name       = var.name
  target_id  = var.pipeline
  yaml       = <<-EOT
  trigger:
    name: ${var.name}
    identifier: ${var.name}
    enabled: true
    description: ""
    tags: {}
    stagesToExecute: []
    orgIdentifier: ${var.organization}
    projectIdentifier: ${var.project}
    pipelineIdentifier: ${var.pipeline}
    source:
        type: Webhook
        spec:
            type: Custom
            spec:
                payloadConditions: []
                headerConditions: []
    EOT
}
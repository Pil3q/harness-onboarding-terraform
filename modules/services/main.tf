resource "harness_platform_service" "this" {
  org_id       = var.organization
  project_id   = var.project
  name         = var.name
  identifier   = var.name

  yaml         = <<-EOT
service:
  name: ${var.name}
  identifier: ${var.name}
  orgIdentifier: ${var.organization}
  projectIdentifier: ${var.project}
  serviceDefinition:
    spec:
      manifests:
        - manifest:
            identifier: kustomize
            type: Kustomize
            spec:
              store:
                type: Github
                spec:
                  connectorRef: account.BCGitAccount
                  gitFetchType: Branch
                  folderPath: overlays
                  repoName: bic-delegate
                  branch: main
              pluginPath: ""
              skipResourceVersioning: false
              enableDeclarativeRollback: false
    type: Kubernetes
EOT
}
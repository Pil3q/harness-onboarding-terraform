resource "harness_platform_pipeline" "this" {
  identifier = var.name
  org_id     = var.organization
  project_id = var.project
  name       = var.name
  yaml       = <<-EOT
pipeline:
  name: ${var.name}
  identifier: ${var.name}
  projectIdentifier: ${var.project}
  orgIdentifier: ${var.organization}
  tags: {}
  stages:
    - stage:
        name: Deploy Delegate
        identifier: Deploy_Delegate
        description: ""
        type: Deployment
        spec:
          deploymentType: Kubernetes
          service:
            serviceRef: Delegate
          environment:
            environmentRef: Local
            deployToAll: false
            infrastructureDefinitions:
              - identifier: Radu_Cluster
          execution:
            steps:
              - step:
                  type: K8sCanaryDeploy
                  name: K8sCanaryDeploy
                  identifier: K8sCanaryDeploy
                  spec:
                    skipDryRun: false
                    instanceSelection:
                      type: Count
                      spec:
                        count: 1
                  timeout: 10m
              - step:
                  type: K8sCanaryDelete
                  name: K8sCanaryDelete
                  identifier: K8sCanaryDelete
                  spec: {}
                  timeout: 10m
              - step:
                  type: K8sRollingDeploy
                  name: K8sRollingDeploy
                  identifier: K8sRollingDeploy
                  spec:
                    skipDryRun: false
                    pruningEnabled: false
                  timeout: 10m
            rollbackSteps:
              - step:
                  name: Rollback Rollout Deployment
                  identifier: rollbackRolloutDeployment
                  type: K8sRollingRollback
                  timeout: 10m
                  spec:
                    pruningEnabled: false
        tags: {}
        failureStrategies:
          - onFailure:
              errors:
                - AllErrors
              action:
                type: StageRollback
  variables:
    - name: cluster
      type: String
      description: ""
      required: false
      value: <+input>
  EOT
}
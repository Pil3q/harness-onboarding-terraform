variable "organization" {
  type = string
  description = "The Harness Organization ID."
}

variable "project" {
  type = string
  description = "The name of the resource."
}

variable "name" {
  description = "The name of the environment."
  default = "delegate_infrastructure"
}

variable "env" {
  description = "The environment for the infrastructure definition."
}

variable "type" {
  description = "The type of the infrastructure definition."
  default     = "KubernetesDirect"
}

variable "connector" {
  description = "The connector used for the infrastructure definition."
}

variable "namespace" {
  description = "The namespace for the deployments."
  default = "harness-delegate-ng"
}

variable "deployment_type" {
  default = "Kubernetes"
}

variable "organization" {
  type        = string
  description = "The Harness Organization ID."
}

variable "project" {
  type        = string
  description = "The name of the resource."
}

variable "name" {
  description = "The name of the pipeline."
  default = "delegate_pipeline"
}
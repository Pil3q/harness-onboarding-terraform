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
  default = "delegate_environment"
}

variable "type" {
  description = "Type of environment."
  default = "PreProduction"
}
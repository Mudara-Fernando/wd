variable "resource_group_name" {}
variable "location" {}
variable "app_service_plan_id" {}
variable "subnet_id" {}
#variable "docker_image" {}
variable "app_name" {}
#variable "docker_image_tag" {}
variable "docker_image" {
  description = "The name of the Docker image"
  type        = string
}

variable "docker_image_tag" {
  description = "The tag of the Docker image"
  type        = string
  default     = "latest"  # You can set a default tag if desired
}

variable "docker_registry" {
  description = "The Docker registry login server"
  type        = string
}

variable "websites_port" {
  description = "The port on which the web application will run"
  type        = string
  default     = "80"
}
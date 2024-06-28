variable "location" {
  default = "West Europe"
}

variable "resource_group_name" {
  default = "wireapps-rg"
}
variable "admin_username" {
  description = "The admin username for the PostgreSQL server"
}

variable "admin_password" {
  description = "The admin password for the PostgreSQL server"
  sensitive   = true
}

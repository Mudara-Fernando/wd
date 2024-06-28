variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_hostname" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "vnet_subnet_id" {
  type = string
}

variable "public_ip_dns" {
  type = string
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
output "acr_id" {
  description = "ID of the Azure Container Registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_admin_username" {
  description = "Admin username for the Azure Container Registry"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "Admin password for the Azure Container Registry"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
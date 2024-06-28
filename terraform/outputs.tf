output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "webapp1_url" {
  value = module.webapp1.webapp_url
}

output "webapp2_url" {
  value = module.webapp2.webapp_url
}

output "postgresql_server_name" {
  value = module.postgresql.server_name
}
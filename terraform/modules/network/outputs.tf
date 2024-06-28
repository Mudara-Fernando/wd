output "webapp_subnet_id" {
  value = azurerm_subnet.webapp_subnet.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.asp.id
}
resource "azurerm_postgresql_server" "server" {
  name                = "wireappsdb"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name                 = "GP_Gen5_2"
  storage_mb               = 5120
  backup_retention_days    = 7
  administrator_login      = var.admin_username
  administrator_login_password = var.admin_password
  version                  = "11"
  ssl_enforcement_enabled  = true
}

resource "azurerm_postgresql_database" "database" {
  name                = "mydatabase"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "allow_azure_ips" {
  name                = "allow-azure-ips"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_firewall_rule" "allow_webapps" {
  name                = "allow-webapps"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.server.name
  start_ip_address    = "10.0.1.0"
  end_ip_address      = "10.0.1.255"
}
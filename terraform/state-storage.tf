resource "azurerm_resource_group" "wireapps-state" {
  name     = "wireapp-state"
  location = "South India"
}

resource "azurerm_storage_account" "statestoragewireapps" {
  name                     = "statestoragewireapps"
  resource_group_name      = azurerm_resource_group.wireapps-state.name
  location                 = azurerm_resource_group.wireapps-state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "devops-challenge-apps" {
  name                  = "devops-challenge-apps"
  storage_account_name  = azurerm_storage_account.statestoragewireapps.name
  container_access_type = "private"
}
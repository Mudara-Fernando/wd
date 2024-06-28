resource "azurerm_storage_account" "statestoragewireapps-vm" {
  name                     = "statestoragewireappsvm"
  resource_group_name      = "WireAppsVM"
  location                 = "South India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "devops-challenge-apps" {
  name                  = "devops-challenge-apps-vm"
  storage_account_name  = azurerm_storage_account.statestoragewireapps-vm.name
  container_access_type = "private"
}
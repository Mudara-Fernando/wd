terraform {
  backend "azurerm" {
   resource_group_name  = "WireAppsVM"
    storage_account_name = "statestoragewireappsvm"
    container_name       = "devops-challenge-apps-vm"
    key                  = "prod.terraform.devops-challenge-apps"
  }
}
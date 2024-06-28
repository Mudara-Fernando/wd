terraform {
  backend "azurerm" {
   resource_group_name  = "wireapp-state"
    storage_account_name = "statestoragewireapps"
    container_name       = "devops-challenge-apps"
    key                  = "prod.terraform.devops-challenge-apps"
  }
}
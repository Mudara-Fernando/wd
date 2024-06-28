provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "wireapps-rg"
  location = "West Europe"
}
module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_subnet_id      = module.network.db_subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  
}

module "webapp1" {
  source              = "./modules/webapp"
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = module.network.app_service_plan_id
  subnet_id           = module.network.webapp_subnet_id
  docker_registry     = module.acr.acr_login_server
  docker_image        = "webapp"
  docker_image_tag    = "latest"
  app_name            = "wireapps-webapp1"
  websites_port       = "5000"
}

module "webapp2" {
  source              = "./modules/webapp"
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_plan_id = module.network.app_service_plan_id
  subnet_id           = module.network.webapp_subnet_id
  docker_registry     = module.acr.acr_login_server
  docker_image        = "api"
  docker_image_tag    = "latest"
  app_name            = "wireapps-webapp2"
  websites_port       = "5000"
}
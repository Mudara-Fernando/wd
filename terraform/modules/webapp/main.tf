resource "azurerm_app_service" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    DOCKER_REGISTRY_SERVER_URL          = "https://wireappsacr.azurecr.io"
    DOCKER_CUSTOM_IMAGE_NAME            = var.docker_image
    WEBSITES_PORT                       = var.websites_port
  }
  site_config {
    linux_fx_version = "DOCKER|${var.docker_registry}/${var.docker_image}:${var.docker_image_tag}"
  }
  https_only = true
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id    = azurerm_app_service.webapp.id
  subnet_id         = var.subnet_id
}
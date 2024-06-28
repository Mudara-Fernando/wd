resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count               = length(var.subnet_names)
  name                = var.subnet_names[count.index]
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = [var.subnet_prefixes[count.index]]
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_subnets" {
  value = azurerm_subnet.subnet[*].id
}
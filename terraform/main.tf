provider "azurerm" {
  features {}
}

# Define resource group
resource "azurerm_resource_group" "wireappsvm_rg" {
  name     = "wireappsvm-rg"
  location = "East US"
}

# Module for network
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.wireappsvm_rg.name
  location            = azurerm_resource_group.wireappsvm_rg.location

  vnet_name           = "wireappsvm-vnet"
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  depends_on = [
    azurerm_resource_group.wireappsvm_rg
  ]
}

# Module for VM
module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.wireappsvm_rg.name
  location            = azurerm_resource_group.wireappsvm_rg.location

  vm_hostname         = "wireappsvm"
  vm_size             = "Standard_DS1_v2"

  admin_username      = "adminuser"
  admin_password      = "Wire@A9P$65!" # Use environment variables or a more secure method for storing sensitive information

  vnet_subnet_id      = module.network.vnet_subnets[0]
  public_ip_dns       = "wireappsvm-dns"

  depends_on = [
    module.network
  ]
}
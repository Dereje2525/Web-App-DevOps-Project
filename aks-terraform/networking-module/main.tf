# Resource Group
resource "azurerm_resource_group" "network_pro"  {
  name = var.resource_group_name
  location = var.location

  
}

# Virtual Network
resource "azurerm_virtual_network"  "vnet" {
  name                = "ask-vnet"
  address_space       = var.vnet_address_space
  resource_group_name = var.resource_group_name
  location            = var.location

}

# Subnet 1
resource "azurerm_subnet" "ask_subnet_1" {
  name                    = "control_plane_subnet_name"
  virtual_network_name    = azurerm_virtual_network.vnet.name
  resource_group_name     = var.resource_group_name
  address_prefixes        = var.subnet_address_space

}

# Subnet 2
resource "azurerm_subnet" "ask_subnet_2" {
  name                 = "worker_node_subnet_name"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes    = var.subnet_address_space
  
  
}

resource "azurerm_network_security_group"  "nsg" {
    name                  = "ask-nsg"
    resource_group_name   = var.resource_group_name
    location              = var.location

    
  
}

 



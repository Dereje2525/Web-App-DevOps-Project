# Resource Group
resource "azurerm_resource_group" "network_pro"  {
  name = var.resource_group_name
  location = var.location

  
}

# Virtual Network
resource "azurerm_virtual_network"  "my_ask_net" {
  name                = "ask-vnet"
  address_space       = var.vnet_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
 # vnet_id             = azurerm_virtual_network.my_ask_net.id
}

# Subnet 1
resource "azurerm_subnet" "ask_subnet_1" {
  name                    = "control-panel-subnet"
  virtual_network_name    = azurerm_virtual_network.my_ask_net.name
  resource_group_name     = var.resource_group_name
  address_prefixes        = var.dns_prefix
  control-panel-subnet_id = azurerm_subnet.ask_subnet_1.id
  control-panel-subnet    = azurerm_subnet.ask_subnet_1.name
  networking_resource_group_Name = var.networking_resource_group_Name
  
}

# Subnet 2
resource "azurerm_subnet" "ask_subnet_2" {
  name                 = "work-node-subnet"
  virtual_network_name = var.resource_group_name
  resource_group_name  = azurerm_resource_group.network_pro.name
  address_prefixes     = var.dns_prefix
  work-node-subnet_id  = azurerm_subnet.ask_subnet_2.id
  
  
}

resource "azurerm_network_security_group"  "nsg" {
    name                  = "ask-nsg"
    resource_group_name   = var.resource_group_name
    location              = var.location

    
  
}

 



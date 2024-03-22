# Resource Group
resource "azurerm_resource_group" "network_pro"  {
  name = var.networking-resource-group
  location = "UK South"
  
}

# Virtual Network
resource "azurerm_virtual_network"  "my_ask_net" {
  name                = "ask-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "azurerm_resource_group.network_pro.location"
  resource_group_name = "azurerm_resource_group_network_pro.name"
}

# Subnet 1
resource "azurerm_subnet" "ask_subnet_1" {
  name                 = "control-panel-subnet"
  virtual_network_name = azurerm_virtual_network.my_ask_net.name
  resource_group_name  = "azurerm_resource_group.network_pro.name"
  resource_group_location = "azurerm_resource_group.network_pro.location"
  address_prefixes     = ["10.0.0.0/24"]

}

# Subnet 2
resource "azurerm_subnet" "ask_subnet_2" {
  name                 = "work-node-subnet"
  virtual_network_name = azurerm_virtual_network.my_ask_net.name
  resource_group_name  = "azurerm_resource_group.network_pro.name"
  resource_group_location = "azurerm_resource_group.network_pro.location"
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_network_security_group"  "nsg" {
    name                  = "ask-nsg"
    location              = "azurerm_resource_group.network_pro.location"
    resource_group_name   = "azurerm_resource_group.network_pro.name"
    kube-apiserver        = "kube-apiserver-rule"  
    SSH_traffic           = "ssh-rule"
    direction             = "Inbound" 

  
}

 



# Resource Group
resource "azurerm_resource_group" "network_pro"  {
  name = var.resource_group_name
  location = var.location

}

# Virtual Network
resource "azurerm_virtual_network"  "vnet" {
  name                = "ask-vnet"
  address_space       = var.vnet_address_space
  resource_group_name = azurerm_resource_group.network_pro.name
  location            = azurerm_resource_group.network_pro.location

}

# Subnet 1
resource "azurerm_subnet" "ask_subnet_1" {
  name                    = "control_plane_subnet_name"
  virtual_network_name    = azurerm_virtual_network.vnet.name
  resource_group_name     = azurerm_resource_group.network_pro.name
  address_prefixes        = ["10.0.1.0/24"]

}

# Subnet 2
resource "azurerm_subnet" "ask_subnet_2" {
  name                 = "worker_node_subnet_name"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  address_prefixes    = ["10.0.2.0/24"]
  
  
}

resource "azurerm_network_security_group"  "nsg" {
    name                  = "ask_nsg"
    resource_group_name   = azurerm_resource_group.network_pro.name
    location              = azurerm_resource_group.network_pro.location
  
}

resource "azurerm_network_security_rule" "kube_apiserver" {
  name                        = "ask_nsg_rulel"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "196.188.224.232"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.network_pro.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "my_ssh_rule"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "196.188.224.232"  
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.network_pro.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}




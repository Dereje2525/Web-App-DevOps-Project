variable "client_secret" {
  type = string
  description = "Enter Cliente ID for applicaction"
  sensitive = true
}
variable "client_id" {	
  type = string
  description = "Enter Cliente Secret for applicaction"
  sensitive = true
}
variable "resource_group_name" {
  description = "The name of the created resource group."
  #default       = azurerm_resource_group.name
}

variable "vnet_id" {
  description = "The id of the created virtual network."
  #default       = azurerm_virtual_network.my_terraform_network.id
}

variable "control_plane_subnet_id" {
  description = "The name of the created subnet 1."
 # default       = azurerm_subnet.my_terraform_subnet_1.control_plane_subnet_id
}

variable "worker_node_subnet_id" {
  description = "The name of the created subnet 2."
  #default       =      azurerm_subnet.my_terraform_subnet_2.worker_node_subnet_id 
}
variable "networking_resource_group_Name" {
  description = "The name of the created subnet 2."
  #default       = azurerm_resource_group.name
}
variable "aks_nsg_id" {
  description = "The name of the aks-nsg."
  #default       = azurerm_network_security_group.ask_nsg_id 
} 

variable "dns_prefix"{
  description = "The name of DNS"
  type = string
}  
  



variable "location" {
  type        = string
  description = "Location of the resource group."
  default     =  "UK South"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
  default     = "networking-resource-group"
}
variable "vnet_address_space"{
   type       = list(string)
   description = "Adress space for the Viertual Network"
   default     =  ["10.0.0.0/16"]
   }

variable "aks_nsg_id" {
   description = "The name of the aks-nsg."
   type       = string
   #default    = azurerm_network_security_group.nsg.id
}
variable "control_plane_subnet_id" {
  description = "The name of the created subnet 1."
  #default = azurerm_subnet.ask_subnet_1.id
  
}

variable "worker_node_subnet_id" {
  description = "The name of the created subnet 2."
  #default = azurerm_subnet.ask_subnet_2.id
   
}
variable "networking_resource_group_Name" {
  description = "The name of the created subnet 2."
  #default     = azurerm_resource_group.network_pro.name
  
  
}

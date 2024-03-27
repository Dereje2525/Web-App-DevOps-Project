
variable "resource_group_name" {
  description = "The name of the created resource group."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the created virtual network"
  type        = string
}

variable "control_plane_subnet" {
   description = "The name of the created subnet 1."
   type        = string
}

variable "worker_node_subnet" {
  description = "The name of the created subnet 2."
  type        = string
}
variable "networking_resource_group_Name" {
  description = "The name of the created subnet 2."

}
variable "aks_nsg" {
  description = "The name of the aks-nsg."
  type        = string
} 

variable "vnet_address_space" {
  type        = list(string)
  description = "CIDR of the vnet"
}

  
variable "location" {
  description = "Location of resource group"
  type = string
  
}  
variable "kubernetes_version" {
  description = "The kubernetes_version"
  type = string
  default = "1.26.6"
}  




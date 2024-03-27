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
  type = string
  description = "The name of the created resource group."

}

variable "location" {
  type        = string
  description = "Region"
}

variable "vm_size" {
  type        = string
  description = "Size of VM"
}
# Virtual Network Address
variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual Network CIDR"
  default     = ["10.163.0.0/16"]  
}


variable "vnet_id" {
  type = string
  description = "The id of the created virtual network."

}

variable "control_plane_subnet" {
  type = string
  description = "The name of the created subnet 1."

}

variable "worker_node_subnet" {
  type = string
  description = "The name of the created subnet 2."
  
}
variable "networking_resource_group_Name" {
  type = string
  description = "The name of the created subnet 2."
 
}
variable "aks_nsg" {
  type = string
  description = "The name of the aks-nsg."
  
} 

variable "dns_prefix"{
  type = string
  description = "The name of DNS"
  
}  
variable "aks_cluster_name" {
  type        = string
  description = "The name of ASK cluster"

}

variable "kubernetes_version" {
   type        = string
   description = "Kebernetes version" 

} 

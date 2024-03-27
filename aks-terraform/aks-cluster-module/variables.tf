
variable "cluster_location" {
  type        = string
  description = "Location of resource groupr"
  default     = "UK South"
}

variable "location" {
  type        = string
  description = "Location of resource groupr"
  default     = "UK South"
}

variable "aks_cluster_name" {
  type        = string
  description = "The name of ASK cluster"

}

variable "dns_prefix" {
   type        = string
   description = "DNS prefix of cluster"
   default     = "myaks-project"

}

variable "kubernetes_version" {
   type        = string
   description = "Kebernetes version" 
   default     = "1.26.6"

} 

variable "service_principal_client_id" {
  type =string
  description = "service principal client ID"

}
variable "service_principal_secret" {
  type =string
  description = "service principal client Secret"

 }

variable "resource_group_name" {
  type =string
  description = "The name of the created resource group."

}

variable "vnet_id" {
  type =string
  description = "The id of the created virtual network."
  
}

variable "control_plane_subnet_id" {
  type =string
  description = "The ID of the created subnet 1."
  
}

variable "worker_node_subnet_id" {
  type =string
  description = "The ID of the created subnet 2."
  
}

variable "aks_nsg_id" {
  type = string
  description = "The ID of the aks-nsg."
 
}

  
# Size of worker nodes
variable "vm_size" {
  type        = string
  description = "vm size"
}
variable "address_space" {
  type        = list(string)
  description = "CIDR of the vnet"
}

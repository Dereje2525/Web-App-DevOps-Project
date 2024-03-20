
variable "cluster_location" {
  type        = string
  description = "Location of the resource group."
  default      = "UK South"
}

variable "cluster_name" {
  type        = string
  description = "Mycluster name"
  default     = "terraform-aks-cluster"
}
variable "dns_prefix"{
   type        = string
   description = "DNS prefit of cluster"
   default     = "myaks-project" 
   }
variable "kubernetes_version"{
   type        = string
   description = "Kebernetes version" 
   default     = "1.26.6"
} 
variable "service_principal_client_id"{
   type        = string
   description = "service_principal_client_id associeted withe ths cluster" 
}
variable "service_principal_secret"{
   type       = string
   description = "service_principal_secret for service principal" 
 }  
 
variable"resource_group_name" {
  description = "The name of the created resource group."
   type       = string
}

variable "vnet_id" {
  description = "The id of the created virtual network."
   type       = string
}

variable "control_plane_subnet_id" {
  description = "The name of the created subnet 1."
   type       = string
}

variable "worker_node_subnet_id" {
  description = "The name of the created subnet 2."
   type       = string
}



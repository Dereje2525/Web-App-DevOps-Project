
variable "cluster_location" {
  type        = string
  description = "Location of the resource group."
  default      = "UK South"
}

variable "ask_cluster_name" {
  type        = string
  description = "ASK cluster name"
  default     = "terraform-aks-cluster"
 
}
variable "dns_prefix" {
   type        = string
   description = "DNS prefix of cluster"
   default     = "myaks-project" 
}

variable "kubernetes_version"{
   type        = string
   description = "Kebernetes version" 
   default     = "1.26.6"
} 


variable "resource_group_name" {
  type        = string
  description = "The name of the created resource group"
 # default       = azurerm_resource_group_cluster_pro.name
}

variable "vnet_id" {
  type        = string	
  description = "The id of the created virtual network."
}

variable "ask_kubeconfig"{
  type        = string
  description = "Kubernetes Configuration file"
 }  

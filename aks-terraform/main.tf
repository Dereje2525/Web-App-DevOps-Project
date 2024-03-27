
# Configure the Microsoft Azure Provider

provider "azurerm" {
  
  features {}
  
    client_id          = "${var.client_id}"
    client_secret      = "${var.client_secret}"
 


  
}  
module "networking-module" {

  source  = "./networking-module"
 
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnet_address_space    = var.vnet_address_space
  vnet_id               = var.vnet_id
  control_plane_subnet  = var.control_plane_subnet
  worker_node_subnet    = var.worker_node_subnet
  aks_nsg               = azurerm_network_security_group.nsg.name
  networking_resource_group_Name = var.networking_resource_group_Name
  
}
 
module "cluster-module" {
 
  source  = "./aks-cluster-module"
  location = var.location
  aks_cluster_name = var.aks_cluster_name
  service_principal_client_id = var.client_id
  service_principal_secret    = var.client_secret
  resource_group_name = var.resource_group_name
  vm_size               = var.vm_size
  address_space         = var.vnet_address_space
  control_plane_subnet_id = var.control_plane_subnet_id
  worker_node_subnet_id = var.worker_node_subnet_id
  kubernetes_version    = var.kubernetes_version
  aks_nsg_id            = var.aks_nsg_id
  dns_prefix            = var.dns_prefix
  vnet_id               = var.vnet_id
 
}
 


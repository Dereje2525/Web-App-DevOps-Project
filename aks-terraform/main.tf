
# Configure the Microsoft Azure Provider

provider "azurerm" {
  features {}
  
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
 
}


module "networking-module" {

  source  = "./networking-module"
  resource_group_name = "networking-resource-group"
  location = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
  

 }
 
module "cluster-module" {

  source  = "./aks-cluster-module"
  service_principal_client_id  = "${var.client_id}"
  service_principal_secret   = "${var.client_secret}"
  cluster_name =var.cluster_name
  dns_prefix = var.dns_prefix 
  kubernetes_version = var.kubernetes_version 
  cluster_location = var.cluster_location
  resource_group_name = var.networking_resource_group
  vnet_id = var.vnet_id
  control_plane_subnet_id = var.control_panel_subnet_id
  worker_node_subnet_id = var.worker_node_subnet_id 
  aks_nsg_id = var.aks_nsg_id
 
}
 
 

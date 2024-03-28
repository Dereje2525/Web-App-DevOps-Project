
# Configure the Microsoft Azure Provider

provider "azurerm" {
  
  features {}
  
    client_id          = "${var.client_id}"
    client_secret      = "${var.client_secret}"
    subscription_id    = "${var.subscription_id}"
    tenant_id          = "${var.tenant_id}"
 


  
}  
module "networking_module" {

  source  = "./networking_module"
 
  resource_group_name         = "networking_resource_group_name"
  location                    = "UK South"
  vnet_address_space          = ["10.10.0.0/16"]
  subnet_address_space        = ["10.0.1.0/24"]
  


  
}
 
module "cluster_module" {
 
  source  = "./aks_cluster_module"
  location         = "UK South"
  cluster_location = "UK South"
  aks_cluster_name = "terraform-aks-cluster"
  kubernetes_version = "1.26.6"
  service_principal_client_id = var.client_id
  service_principal_secret    = var.client_secret
  resource_group_name = module.networking_module.networking_resource_group_name
  control_plane_subnet_id = module.networking_module.control_plane_subnet_id
  worker_node_subnet_id = module.networking_module.worker_node_subnet_id
  #aks_nsg_id            = module.networking_module.aks_nsg_id
  dns_prefix            = "myaks-project"
  vnet_id               = module.networking_module.control_plane_subnet_id
  vm_size    = "Standard_DS1_v2"
 
}
 



# Configure the Microsoft Azure Provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  
  features {}
  
    client_id          = var.client_id
    client_secret      = var.client_secret
    subscription_id    = "dfe66b53-7ab5-4f19-8786-668ac367b573"
    tenant_id          = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
  

   
}
 
  
 
module "networking" {

  source  = "./networking-module"
 
  resource_group_name         = "networking-resource-group"
  location                    = "UK South"
  vnet_address_space          = ["10.10.0.0/16"]
  subnet_address_space        = ["10.0.1.0/24"]
  


  
}
 
module "aks_cluster" {
 
  source               = "./aks-cluster-module"
  location             = "UK South"
  cluster_location     = "UK South"
  aks_cluster_name     = "terraform-aks-cluster"
  kubernetes_version   = "1.26.6"
  service_principal_client_id       = var.client_id
  service_principal_client_secret   = var.client_secret
  resource_group_name               = module.networking.networking_resource_group_name
  control_plane_subnet_id           = module.networking.control_plane_subnet_id
  worker_node_subnet_id             = module.networking.worker_node_subnet_id
  dns_prefix            = "myaks-project"
  vnet_id               = module.networking.control_plane_subnet_id
  vm_size               = "Standard_DS1_v2"
 
}
 


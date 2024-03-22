
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
  resource_group_name = "azurerm_resource_group_my_resource_group.name"
  ask_cluster_name = "terraform-aks-cluster"
  dns_prefix = "myaks-project" 
  kubernetes_version  = "1.26.6"
  vnet_id  = azurerm_virtual_network.my_ask_net.id
  ask_kubeconfig= azurerm_kubernetes_cluster.claster_name.kube_config_raw
  control_plane_subnet_id = module.networking-module.azurerm_subnet.ask_subnet_1.id
  worker_node_subnet_id = module.networking-module.azurerm_subnet.ask_subnet_2.id
  aks_nsg_id = module.networking-module.azurerm_network_security_group.nsg.id 
 
}
 


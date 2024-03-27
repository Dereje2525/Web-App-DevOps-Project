
resource "azurerm_resource_group" "cluster_pro" {
  name     = "myclusterresourcegroup"
  location = "UK South"
 
}

resource "azurerm_kubernetes_cluster" "ask-cluster" {
  location            = var.location
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  default_node_pool {
  name       = "agentpool"
  vm_size    = var.vm_size


  } 
 }
  



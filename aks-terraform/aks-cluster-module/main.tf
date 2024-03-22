resource "azurerm_resource_group" "cluster_pro" {
  name     = "myclusterresourcegroup"
  location = "UK South"
 
}

resource "azurerm_kubernetes_cluster" "claster_name" {
  location            = azurerm_resource_group.cluster_pro.location
  name                = "My-terraform-aks-cluster"
  resource_group_name = "azurerm_resource_group.cluster_pro.name"
  dns_prefix          = "myaks-project"
  default_node_pool {
   name       = "agentpool"
   vm_size    = "Standard_D2_v2"

  } 
 }
  



resource "azurerm_resource_group" "cluster_pro" {
  name     = "myclusterresourcegroup"
  location = "UK South"
 
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.cluster_pro.location
  name                = "My-terraform-aks-cluster"
  resource_group_name = "azurerm_resource_group.cluster_pro.name"
  default_node_pool {
   name       = "agentpool"
   vm_size    = "Standard_D2_v2"

  }
 
  
service_principal_secret {
    client_id     = var.client_id
    client_secret = var.client-secret
 }
}


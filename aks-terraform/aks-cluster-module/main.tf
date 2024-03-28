
resource "azurerm_resource_group" "cluster_pro" {
  name     = "myclusterresourcegroup"
  location = "UK South"
 
}

resource "azurerm_kubernetes_cluster" "ask-cluster" {
  location                    = var.location
  name                        = var.aks_cluster_name
  resource_group_name         = var.resource_group_name
  #service_principal_client_id = var.service_principal_client_id
  #service_principal_secret    = var.service_principal_secret
  default_node_pool {
  name       = "agentpool"
  vm_size    = "Standard_DS1_v2"


  } 
 }
  



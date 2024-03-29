


resource "azurerm_kubernetes_cluster" "ask-cluster" {
  location                    = var.cluster_location
  name                        = var.aks_cluster_name
  resource_group_name         = var.resource_group_name
  dns_prefix                  = var.dns_prefix
  default_node_pool {
  name       = "default"
  node_count = 1
  vm_size    = "Standard_DS1_v2"
  enable_auto_scaling = true
  min_count =1
  max_count =3

  } 
 
 service_principal{
 client_id = var.service_principal_client_id
 client_secret = var.service_principal_client_secret
 }
}


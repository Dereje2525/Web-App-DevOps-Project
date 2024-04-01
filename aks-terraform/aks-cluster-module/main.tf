


resource "azurerm_kubernetes_cluster" "ask-cluster" {
  location                    = var.cluster_location
  name                        = var.aks_cluster_name
  resource_group_name         = var.resource_group_name
  dns_prefix                  = var.dns_prefix
  default_node_pool {
  name       = "default"
  node_count = 1
  vm_size    = "Standard_DS2_v2"
  enable_auto_scaling = true
  #kubernetes_version = var.kubernetes_version
  min_count =1
  max_count =3

  } 
 
 service_principal{
 client_id = "8aab71e6-c7bc-4c6a-a108-5c44ebfd38a3"
 client_secret = "5HP8Q~mh1zuhmruko6HJv1wlGVGUysBYb.LOWaxz"
 }
}


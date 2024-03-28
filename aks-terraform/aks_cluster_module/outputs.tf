
output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.ask-cluster.name
}


# AKS Cluster ID
output "ask_cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.ask-cluster.id
}



# kubeconfig file

#resource "local_file" "kubeconfig" {
 # depends_on = [azurerm_kubernetes_cluster.aks-cluster]
 # filename   = "kubeconfig"
 # content    = azurerm_kubernetes_cluster.aks-cluster.kube_config_raw
#}


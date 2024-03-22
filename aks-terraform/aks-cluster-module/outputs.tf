
output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.claster_name.name
}


# AKS Cluster ID
output "aks-cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.claster_name.id
}

# kubeconfig file

output "ask_kubeconfig" {
  value = azurerm_kubernetes_cluster.claster_name.kube_config_raw
  sensitive = true
}



output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.default.name
}


# AKS Cluster ID
output "aks-cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.default.id
}

# kubeconfig file
output "ask_kubeconfig" {
  description   = "Kebernet Configuretion file of cluster"
  value = azurerm_kubernetes_cluster.default.kube_config
}



output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.ask-cluster.name
}


# AKS Cluster ID
output "ask_cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.ask-cluster.id
}

output "aks_kubeconfig" {
  description = "Kubeconfig file for accessing the AKS cluster."
  value       = azurerm_kubernetes_cluster.ask-cluster.kube_config_raw
}



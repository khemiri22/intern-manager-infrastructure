output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "cluster_endpoint" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
}
output "cluster_identity_principal_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
}
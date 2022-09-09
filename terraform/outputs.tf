output "client_certificate" {
  value     = aks.azurerm_kubernetes_cluster.product.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = aks.azurerm_kubernetes_cluster.product.kube_config_raw
  sensitive = true
}

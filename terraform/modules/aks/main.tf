resource "azurerm_kubernetes_cluster" "product" {
  name                = "product-aks1"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "productaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

terraform {
  required_providers {
    kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">= 2.17.0"
    }
  }
}

resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.node_pool.name
    node_count = var.node_pool.node_count
    vm_size    = var.node_pool.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  value = azurerm_kubernetes_cluster.aks.resource_group_name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0
}
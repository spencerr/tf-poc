locals {
  cluster_name = "tfpoc-prod-aks"
  resource_group_name = "tfpoc-cluster-prod-rg"
  location = "East US"
  dns_prefix = "tfpoc-prod-aks"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
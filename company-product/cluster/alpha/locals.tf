locals {
  cluster_name = "tfpoc-alpha-aks"
  resource_group_name = "tfpoc-cluster-alpha-rg"
  location = "East US"
  dns_prefix = "tfpoc-alpha-aks"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
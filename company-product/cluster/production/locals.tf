locals {
  cluster_name = "aks-production-tfpoc"
  resource_group_name = "rg-production-tfpoc-cluster"
  location = "East US"
  dns_prefix = "aks-production-tfpoc"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
locals {
  cluster_name = "aks-tfpoc"
  resource_group_name = "rg-tfpoc-cluster"
  location = "East US"
  dns_prefix = "aks-tfpoc"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
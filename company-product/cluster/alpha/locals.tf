locals {
  cluster_name = "aks-alpha-tfpoc"
  resource_group_name = "rg-alpha-tfpoc-cluster"
  location = "East US"
  dns_prefix = "aks-alpha-tfpoc"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
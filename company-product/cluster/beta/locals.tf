locals {
  cluster_name = "aks-beta-tfpoc"
  resource_group_name = "rg-beta-tfpoc-cluster"
  location = "East US"
  dns_prefix = "aks-beta-tfpoc"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
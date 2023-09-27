locals {
  cluster_name = "aks-sandbox-tfpoc"
  resource_group_name = "rg-sandbox-tfpoc-cluster"
  location = "East US"
  dns_prefix = "aks-sandbox-tfpoc"
  node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
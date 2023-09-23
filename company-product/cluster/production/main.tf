module "aks_cluster" {
  source = "git::https://github.com/spencerr/tf-poc//company-product/cluster/module/?ref=1.0.0"

  resource_group_name = local.resource_group_name
  cluster_name        = local.cluster_name
  location            = local.location
  dns_prefix          = local.dns_prefix
  node_pool           = local.node_pool
}

output "cluster_name" {
  value = module.aks_cluster.cluster_name
}

output "resource_group_name" {
  value = module.aks_cluster.resource_group_name
}

output "kube_config" {
  value = module.aks_cluster.kube_config
}
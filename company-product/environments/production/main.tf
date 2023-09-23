terraform {
  required_version = "~> 1.5.7"

  backend "azurerm" {
    resource_group_name  = "rg-production-tfpoc-init"
    storage_account_name = "saproductiontfpocinit"
    container_name       = "tfstate"
    key                  = "tfpoc.terraform.tfstate"
    subscription_id      = "8f09f7f4-7b25-4d6f-88a5-847b1751c4ce"
    tenant_id            = "4878e0c1-7017-468b-85f3-3686e1326e53"
  }   
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.20.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  subscription_id            = local.subscription_id
  features {}
}

module "cluster" {
  source = "../../cluster/production"
}


provider "kubernetes" {
  host                   = module.cluster.kube_config.host
  client_certificate     = base64decode(module.cluster.kube_config.client_certificate)
  client_key             = base64decode(module.cluster.kube_config.client_key)
  cluster_ca_certificate = base64decode(module.cluster.kube_config.cluster_ca_certificate)
}

module "feature" {
  source = "../../feature/production"
  depends_on = [ module.cluster ]
}
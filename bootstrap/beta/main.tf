terraform {
  required_version = "~> 1.5.7"

  backend "azurerm" {
    resource_group_name  = "rg-beta-tfpoc-init"
    storage_account_name = "sabetatfpocinit"
    container_name       = "tfstate"
    key                  = "init.terraform.tfstate"
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

module "bootstrap" {
  source = "git::https://github.com/spencerr/tf-poc//bootstrap/module/?ref=v1.0.0"

  key_vault_name = local.key_vault_name
  region = local.region
  resource_group_name = local.resource_group_name
  tenant_id = local.tenant_id
  subscription_id = local.subscription_id
}
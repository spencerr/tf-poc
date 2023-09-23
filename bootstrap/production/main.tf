terraform {
  backend "azurerm" {
    resource_group_name  = "tfpoc-init-alpha-rg"
    storage_account_name = "tfpocinitalphasa"
    container_name       = "tfstate"
    key                  = "init.terraform.tfstate"
    subscription_id      = "2bb7286d-7bcd-4b05-9bb2-62bcbcd87e2c"
    tenant_id            = "5a5b9e61-20b2-4578-8f37-246881fa0d61"
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

module "aks_cluster" {
  source = "git::https://github.com/spencerr/tf-poc//bootstrap/module/?ref=1.0.0"

  key_vault_name = local.key_vault_name
  region = local.region
  resource_group_name = local.resource_group_name
  tenant_id = local.tenant_id
  subscription_id = local.subscription_id
}
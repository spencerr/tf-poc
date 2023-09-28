terraform {
  required_version = "~> 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.20.0"
    }
  }
}

locals {
  resource_group_name = "rg-app-insights-harness"
  location = "East US"
}


resource "azurerm_resource_group" "ai" {
  name     = local.resource_group_name
  location = local.location
}

module "app_insights" {
  source              = "../"
  location            = azurerm_resource_group.ai.location
  resource_group_name = azurerm_resource_group.ai.name
  name                = local.name
  application_type    = local.application_type

  log_analytics_workspace_id = azurerm_log_analytics_workspace.diagnostic_law.id
  tags                       = local.tags
}
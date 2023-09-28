terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.20.0"
    }
  }
}

provider "azurerm" {
  features {
    application_insights {
      disable_generated_rule = true
    }
  }
}

resource "azurerm_application_insights" "ai" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  application_type    = var.application_type

  tags = var.tags

  lifecycle {
    ignore_changes = [tags["BuiltTimeStamp"], ]
  }
}

variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "application_type" {
  type = string
}

variable "tags" {
  type = map(string)
}

output "instrumentation_key" {
  description = "Instrumentation Key for this Application Insights component"
  value       = azurerm_application_insights.ai.instrumentation_key
  sensitive   = true
}

output "app_id" {
  description = "App ID associated with this Application Insights component."
  value       = azurerm_application_insights.ai.app_id
}
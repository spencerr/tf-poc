variable "key_vault_name" {
  type = string
}

variable "region" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "secret_namespace" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "test_secret_key_vault_id" {
  type = string
}

variable "redis" {
  type = object({
    capacity = number
    enabled = bool
    name = string
    sku_name = string
  })
  default = {
    capacity = 0
    enabled = false
    name = ""
    sku_name = ""
  }
}

variable "cosmosdb" {
  type = object({
    enabled = bool
    name = string
    sku_name = string
  })
  default = {
    enabled = false
    name = ""
    sku_name = ""
  }
}

variable "app_insights" {
  type = object({
    name = string
    application_type = string
    log_analytics_workspace_id = string
  })
}
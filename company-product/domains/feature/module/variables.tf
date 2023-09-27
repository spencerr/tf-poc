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
    enabled = false
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
  }
}
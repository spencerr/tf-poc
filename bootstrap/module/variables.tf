
variable "key_vault_name" {
  description = "The name of the key vault being created."
  default = "tfpoc-bootstrap-kv"
}

variable "region" {
  description = "The region to create the resources within."
  default = "East US"
}

variable "resource_group_name" {
  description = "The resource group to create resources within."
  default = "tfpoc-bootstrap-rg"
}

variable "tenant_id" {
  description = "The tenant to create resources within."
}

variable "subscription_id" {
  description = "The subscription to create resources within."
}
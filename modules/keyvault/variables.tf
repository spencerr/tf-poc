variable "name" {
  type = string
}

variable "location" {
  type = string
  default = "East US"
}

variable "resource_group" {
  type = azurerm_resource_group
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
  default = "East US"
}

variable "tenant_id" {

}
resource "azurerm_resource_group" "bootstrap" {
  name     = var.resource_group_name
  location = var.region
}

resource "azurerm_key_vault" "bootstrap" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.bootstrap.location
  resource_group_name         = azurerm_resource_group.bootstrap.name
  sku_name                    = "standard"  # You can use "premium" for a premium SKU
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
}
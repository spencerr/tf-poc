resource "azurerm_key_vault" "vault" {
  name                        = var.name
  location                    = coalesce(var.resource_group.location, var.resource_group_location)
  resource_group_name         = coalesce(var.resource_group.name, var.resource_group_name)
  sku_name                    = "standard"  # You can use "premium" for a premium SKU
  tenant_id                   = var.tenant_id
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
}

output "vault" {
  value = azurerm_key_vault.vault
}
locals {
  cosmosdb = {
    enabled = true
    name = "cos-preview-tfpoc-feature"
    sku_name = "Standard"
  }
  key_vault_name = "kv-preview-tfpoc-feature"
  region = "East US"
  resource_group_name = "rg-preview-tfpoc-feature"
  secret_namespace = "preview"
  storage_account_name = "sapreviewfeature"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/rg-beta-tfpoc-bootstrap/providers/Microsoft.KeyVault/vaults/kv-beta-tfpoc-bootstrap"
}
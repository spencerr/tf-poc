locals {
  key_vault_name = "kv-alpha-tfpoc-feature"
  region = "East US"
  resource_group_name = "rg-alpha-tfpoc-feature"
  secret_namespace = "alpha"
  storage_account_name = "saalphafeature"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/rg-alpha-tfpoc-bootstrap/providers/Microsoft.KeyVault/vaults/kv-alpha-tfpoc-bootstrap"
  redis = {
    capacity = 2
    enabled = true
    name = "rc-alpha-tfpoc-feature"
    sku_name = "Standard"
  }
}
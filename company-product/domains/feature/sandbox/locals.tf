locals {
  key_vault_name = "kv-sandbox-tfpoc-feature"
  region = "East US"
  resource_group_name = "rg-sandbox-tfpoc-feature"
  secret_namespace = "sandbox"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/rg-sandbox-tfpoc-bootstrap/providers/Microsoft.KeyVault/vaults/kv-sandbox-tfpoc-bootstrap"
  redis = {
    capacity = 2
    enabled = true
    name = "rc-sandbox-tfpoc-feature"
    sku = "Standard"
  }
  cosmosdb = {
    enabled = false
    name = "cdb-sandbox-tfpoc-feature"
    sku_name = "Standard"
  }
}
locals {
  region = "East US"
  resource_group_name = "rg-production-tfpoc-feature"
  cosmosdb_name = "cdb-production-tfpoc-feature"
  secret_namespace = "production"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/rg-prod-tfpoc-bootstrap/providers/Microsoft.KeyVault/vaults/kv-prod-tfpoc-bootstrap"
}
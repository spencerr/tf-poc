locals {
  region = "East US"
  resource_group_name = "tfpoc-feature-prod-rg"
  cosmosdb_name = "tfpoc-feature-prod-cdb"
  secret_namespace = "production"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/tfpoc-bootstrap-alpha-rg/providers/Microsoft.KeyVault/vaults/test-keyvault"
}
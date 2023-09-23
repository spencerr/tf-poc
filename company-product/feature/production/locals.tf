locals {
  region = "East US"
  resource_group_name = "tfpoc-feature-prod-rg"
  cosmosdb_name = "tfpoc-feature-prod-cdb"
  secret_namespace = "production"
  test_secret_key_vault_id = "/subscriptions/2bb7286d-7bcd-4b05-9bb2-62bcbcd87e2c/resourceGroups/tfpoc-bootstrap-alpha-rg/providers/Microsoft.KeyVault/vaults/test-keyvault"
}
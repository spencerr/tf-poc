locals {
  key_vault_name = "kv-sand-tfpoc-feature"
  region = "East US"
  resource_group_name = "rg-sandbox-tfpoc-feature"
  secret_namespace = "sandbox"
  storage_account_name = "sasandfeature"
  test_secret_key_vault_id = "/subscriptions/8f09f7f4-7b25-4d6f-88a5-847b1751c4ce/resourceGroups/rg-sandbox-tfpoc-bootstrap/providers/Microsoft.KeyVault/vaults/kv-sand-tfpoc-bootstrap"
  redis = {
    capacity = 2
    enabled = true
    name = "rc-sandbox-tfpoc-feature"
    sku_name = "Standard"
  }
  cosmosdb = {
    enabled = false
    name = "cdb-sandbox-tfpoc-feature"
    sku_name = "Standard"
  }

  app_insights = {
    name = "ai-sandbox-tfpoc-feature"
    application_type = "web"
    log_analytics_workspace_id = "0323cff5-fc49-46d9-98a5-f6d3e82b1290"
  }
}
module "feature" {
  source = "git::https://github.com/spencerr/tf-poc//company-product/domains/feature/module/?ref=company-product-v0.0.13"

  cosmosdb            = local.cosmosdb
  key_vault_name      = local.key_vault_name
  region              = local.region
  resource_group_name = local.resource_group_name
  secret_namespace    = local.secret_namespace
  storage_account_name = local.storage_account_name
  test_secret_key_vault_id = local.test_secret_key_vault_id
  app_insights = local.app_insights
}
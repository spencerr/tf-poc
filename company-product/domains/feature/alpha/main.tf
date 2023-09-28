module "feature" {
  source = "../module"

  key_vault_name      = local.key_vault_name
  redis               = local.redis
  region              = local.region
  resource_group_name = local.resource_group_name
  secret_namespace    = local.secret_namespace
  storage_account_name = local.storage_account_name
  test_secret_key_vault_id = local.test_secret_key_vault_id
  app_insights = local.app_insights
}
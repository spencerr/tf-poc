module "feature" {
  source = "git::https://github.com/spencerr/tf-poc//company-product/feature/module/?ref=v1.0.0"

  cosmosdb_name       = local.cosmosdb_name
  region              = local.region
  resource_group_name = local.resource_group_name
  secret_namespace    = local.secret_namespace
  test_secret_key_vault_id = local.test_secret_key_vault_id
}
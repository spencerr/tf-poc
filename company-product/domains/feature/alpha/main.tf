module "feature" {
  source = "git::https://github.com/spencerr/tf-poc//company-product/domains/feature/module/?ref=company-product-v0.0.7"

  key_vault_name      = local.key_vault_name
  redis               = local.redis
  region              = local.region
  resource_group_name = local.resource_group_name
  secret_namespace    = local.secret_namespace
  test_secret_key_vault_id = local.test_secret_key_vault_id
}
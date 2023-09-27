resource "azurerm_resource_group" "feature" {
  name     = var.resource_group_name
  location = var.region
}

resource "azurerm_cosmosdb_account" "feature" {
  count               = var.cosmosdb.enabled ? 1 : 0
  name                = var.cosmosdb.name
  location            = azurerm_resource_group.feature.location
  resource_group_name = azurerm_resource_group.feature.name
  offer_type          = var.cosmosdb.sku_name
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location          = azurerm_resource_group.feature.location
    failover_priority = 0
  }
}

resource "azurerm_redis_cache" "feature" {
  count               = var.redis.enabled ? 1 : 0
  name                = var.redis.name
  location            = azurerm_resource_group.feature.location
  resource_group_name = azurerm_resource_group.feature.name
  capacity            = var.capacity
  family              = var.redis.sku_name == "Premium" ? "P" : "C"
  sku_name            = var.redis_sku_name
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {

  }
}

module "feature_key_vault" {
  source = "git::https://github.com/spencerr/tf-poc//modules/keyvault/?ref=modules-v0.0.3"

  name                    = var.key_vault_name
  location                = var.region
  resource_group_name     = azurerm_resource_group.feature.name
  tenant_id               = data.azurerm_client_config.current.tenant_id
}

resource "kubernetes_namespace" "secret_namespace" {
  metadata {
    name = var.secret_namespace
  }
}

resource "kubernetes_secret" "cosmosdb-secret" {
  metadata {
    name      = "feature-secrets"
    namespace = kubernetes_namespace.secret_namespace.metadata.0.name
  }

  data = {
    COSMOSDB_CONNECTION_STRING = coalesce(azurerm_cosmosdb_account.feature.primary_sql_connection_string, "")
    REDIS_CONNECTION_STRING = coalesce(azurerm_redis_cache.feature.primary_connection_string, "")
    TEST_SECRET = data.azurerm_key_vault_secret.test_secret.value
    KEY_VAULT_CONNECTION_STRING = module.feature_key_vault.vault.vault_uri
  }

  depends_on = [ kubernetes_namespace.secret_namespace ]
}
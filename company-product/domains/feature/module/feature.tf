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
  capacity            = var.redis.capacity
  family              = var.redis.sku_name == "Premium" ? "P" : "C"
  sku_name            = var.redis.sku_name
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

  redis_configuration {

  }
}

module "feature_key_vault" {
  source = "git::https://github.com/spencerr/tf-poc//modules/keyvault/?ref=modules-v0.0.5"

  name                    = var.key_vault_name
  location                = var.region
  resource_group_name     = azurerm_resource_group.feature.name
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
    COSMOSDB_CONNECTION_STRING = try(azurerm_cosmosdb_account.feature.0.primary_sql_connection_string, "")
    REDIS_CONNECTION_STRING = try(azurerm_redis_cache.feature.0.primary_connection_string, "")
    TEST_SECRET = data.azurerm_key_vault_secret.test_secret.value
    KEY_VAULT_CONNECTION_STRING = module.feature_key_vault.vault.vault_uri
    STORAGE_ACCOUNT_CONNECTION_STRING = azurerm_storage_account.feature.primary_connection_string
  }

  depends_on = [ kubernetes_namespace.secret_namespace ]
}

resource "azurerm_storage_account" "feature" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.feature.name
  location            = azurerm_resource_group.feature.location
  account_tier        = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "feature" {
  name = "documents"
  storage_account_name = azurerm_storage_account.feature.name
  container_access_type = "private"
}

module "feature_app_insights" {
  source = "git::https://github.com/spencerr/tf-poc//modules/application-insights/?ref=modules-v0.0.6"

  name = var.app_insights.name
  resource_group_name = azurerm_resource_group.feature.name
  location = azurerm_resource_group.feature.location
  log_analytics_workspace_id = var.app_insights.log_analytics_workspace_id
  application_type = var.app_insights.application_type
  tags = {}
}
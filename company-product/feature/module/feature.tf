resource "azurerm_resource_group" "feature" {
  name     = var.resource_group_name
  location = var.region
}

resource "azurerm_cosmosdb_account" "feature" {
  name                = var.cosmosdb_name
  location            = azurerm_resource_group.feature.location
  resource_group_name = azurerm_resource_group.feature.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location          = azurerm_resource_group.feature.location
    failover_priority = 0
  }
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
    CONNECTION_STRING = azurerm_cosmosdb_account.feature.primary_sql_connection_string
    TEST_SECRET = data.azurerm_key_vault_secret.test_secret.value
  }

  depends_on = [ kubernetes_namespace.secret_namespace ]
}
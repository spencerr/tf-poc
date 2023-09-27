output "resource_group" {
  value = azurerm_resource_group.feature
}

output "redis" {
  value = azurerm_redis_cache.feature
}

output "cosmosdb" {
  value = azurerm_cosmosdb_account.feature
}
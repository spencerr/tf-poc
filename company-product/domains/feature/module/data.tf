data "azurerm_key_vault_secret" "test_secret" {
  name         = "Test--Secret"
  key_vault_id = var.test_secret_key_vault_id  # Replace with your subscription ID and resource group name
}
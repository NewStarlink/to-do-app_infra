resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssqlserver_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.db_username.value
  administrator_login_password = data.azurerm_key_vault_secret.db_password.value
}



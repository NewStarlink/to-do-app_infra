resource "azurerm_mssql_database" "mssql_db" {
  name         = var.mssql_db_name
  server_id    = data.azurerm_mssql_server.mssql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  }



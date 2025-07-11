module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

}

module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name     = var.resource_group_name2
  resource_group_location = var.resource_group_location2
}

module "resource_group97" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name     = var.resource_group_name97
  resource_group_location = var.resource_group_location97

module "resource_group99" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name     = var.resource_group_name99
  resource_group_location = var.resource_group_location99
}
module "resource_group87" {
  source = "../../modules/azurerm_resource_group"

  resource_group_name     = var.resource_group_name87
  resource_group_location = var.resource_group_location87
}

module "key_vault" {
  source                  = "../../modules/azurerm_key_vault"
  depends_on              = [module.resource_group]
  key_vault_name          = var.key_vault_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location

}
module "key_vault_secrets_vm1_username" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "vm1-username"
  secret_value        = var.vm1_username
  resource_group_name = var.resource_group_name
}

module "key_vault_secrets_vm1_password" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "vm1-password"
  secret_value        = var.vm1_password
  resource_group_name = var.resource_group_name
}

module "key_vault_secrets_vm2_username" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "vm2-username"
  secret_value        = var.vm2_username
  resource_group_name = var.resource_group_name
}

module "key_vault_secrets_vm2_password" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "vm2-password"
  secret_value        = var.vm2_password
  resource_group_name = var.resource_group_name
}

module "virtual_network" {
  source                  = "../../modules/azurerm_virtual_network"
  depends_on              = [module.resource_group]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  virtual_network_name    = var.virtual_network_name
  address_space           = var.address_space
}
module "frontend_subnet" {
  source               = "../../modules/azurerm_subnet"
  depends_on           = [module.virtual_network]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = var.frontend_subnet_name
  address_prefixes     = var.address_prefix_frontend
}

module "backend_subnet" {
  source               = "../../modules/azurerm_subnet"
  depends_on           = [module.virtual_network]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = var.backend_subnet_name
  address_prefixes     = var.address_prefix_backend
}

module "public_ip_frontend" {
  source                  = "../../modules/azurerm_public_ip"
  depends_on              = [module.resource_group]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  public_ip_name          = var.public_ip_frontend
  allocation_method       = var.allocation_method

}

module "public_ip_backend" {
  source                  = "../../modules/azurerm_public_ip"
  depends_on              = [module.resource_group]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  public_ip_name          = var.public_ip_backend
  allocation_method       = var.allocation_method

}

module "frontend_vm" {
  source                  = "../../modules/azurerm_linux_virtual_machine"
  depends_on              = [module.key_vault, module.frontend_subnet, module.public_ip_frontend, module.key_vault_secrets_vm1_username, module.key_vault_secrets_vm1_password]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vm_name                 = var.vm1_name
  vm_size                 = var.vm1_size
  username_secret_name    = var.vm1_username
  password_secret_name    = var.vm1_password
  nic_name                = var.nic_name_frontend
  subnet_name             = var.frontend_subnet_name
  virtual_network_name    = var.virtual_network_name
  public_ip_name          = var.public_ip_frontend
  vm_publisher            = var.vm1_publisher
  vm_offer                = var.vm1_offer
  vm_sku                  = var.vm1_sku
  vm_version              = var.vm1_version
  key_vault_id            = data.azurerm_key_vault.key_vault.id
  key_vault_name          = var.key_vault_name
}

module "backend_vm" {
  source                  = "../../modules/azurerm_linux_virtual_machine"
  depends_on              = [module.key_vault, module.backend_subnet, module.public_ip_backend, module.key_vault_secrets_vm2_username, module.key_vault_secrets_vm2_password]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  vm_name                 = var.vm2_name
  vm_size                 = var.vm2_size
  username_secret_name    = var.vm2_username
  password_secret_name    = var.vm2_password
  nic_name                = var.nic_name_backend
  subnet_name             = var.backend_subnet_name
  virtual_network_name    = var.virtual_network_name
  public_ip_name          = var.public_ip_backend
  vm_publisher            = var.vm2_publisher
  vm_offer                = var.vm2_offer
  vm_sku                  = var.vm2_sku
  vm_version              = var.vm2_version
  key_vault_id            = data.azurerm_key_vault.key_vault.id
  key_vault_name          = var.key_vault_name
}


module "sql_server" {
  source                  = "../../modules/azurerm_sql_server"
  depends_on              = [module.resource_group, module.key_vault, module.key_vault_secrets_db_username, module.key_vault_secrets_db_password]
  mssqlserver_name        = var.mssqlserver_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  key_vault_name          = var.key_vault_name

}

module "sql_database" {
  source              = "../../modules/azurerm_sql_database"
  depends_on          = [module.sql_server]
  resource_group_name = var.resource_group_name
  mssql_server_name   = var.mssqlserver_name
  mssql_db_name       = var.sql_db_name

}
module "key_vault_secrets_db_username" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "db-username"
  secret_value        = var.db_username
  resource_group_name = var.resource_group_name
}

module "key_vault_secrets_db_password" {
  source              = "../../modules/azurerm_key_vault_secrets"
  depends_on          = [module.key_vault]
  key_vault_name      = var.key_vault_name
  secret_name         = "db-password"
  secret_value        = var.db_password
  resource_group_name = var.resource_group_name

}
module "network_security_group" {
  source                  = "../../modules/azurerm_network_security_group"
  depends_on              = [module.resource_group, module.frontend_subnet, module.backend_subnet]
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  nsg_name                = var.nsg_name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
}

module "subnet_nsg_association" {
  source                  = "../../modules/azurerm_network_security_group"
  depends_on              = [module.network_security_group, module.frontend_subnet, module.backend_subnet]
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  nsg_name                = var.nsg_name
  resource_group_location = var.resource_group_location
}

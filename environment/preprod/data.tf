data "azurerm_key_vault" "key_vault" {
  depends_on = [ module.key_vault ]
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_network_security_group" "nsg" {
  depends_on = [module.network_security_group]
  name                 = var.nsg_name
  resource_group_name  = var.resource_group_name
}


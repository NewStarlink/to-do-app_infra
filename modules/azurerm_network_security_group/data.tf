data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_network_security_group" "nsg" {
  depends_on = [azurerm_network_security_group.nsg]
  name                 = var.nsg_name
  resource_group_name  = var.resource_group_name
}
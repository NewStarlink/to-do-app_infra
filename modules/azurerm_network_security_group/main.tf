
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
 name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

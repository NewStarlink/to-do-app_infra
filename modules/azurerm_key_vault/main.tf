resource "azurerm_key_vault" "key_vault" {
    name                = var.key_vault_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    tenant_id           = data.azurerm_client_config.current.tenant_id
    sku_name            = "standard"
    
    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id
    
        key_permissions         = ["Get", "List", "Create", "Delete"]
        secret_permissions      = ["Get", "List", "Set", "Delete"]
        certificate_permissions = ["Get", "List", "Create", "Delete"]
    }
    
  
}


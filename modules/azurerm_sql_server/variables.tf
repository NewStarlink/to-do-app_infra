variable "mssqlserver_name" {
  description = "The name of the SQL server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  default     = "West Europe"
  
}
variable "key_vault_name" {
  description = "The name of the key vault."
  type        = string
}
variable "mssql_db_name" {
  description = "The name of the SQL database."
  type        = string
  default     = "exampledb"
  
}
variable "mssql_server_name" {
  description = "The name of the SQL server."
  type        = string
  default     = "example-sql-server"
  
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "example-resource-group"
  
}


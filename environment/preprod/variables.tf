variable "subscription_id" {
  description = "The subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "preprod-rg"
  
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "West Europe"
}

variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string 
}

variable "vm1_username" {
  description = "The username for VM1"
  type        = string
  sensitive = true
}

variable "vm1_password" {
  description = "The password for VM1"
  type        = string
  sensitive = true
  
}

variable "vm2_username" {
  description = "The username for VM2"
  type        = string
  sensitive = true
}

variable "vm2_password" {
  description = "The password for VM2"
  type        = string
  sensitive = true

}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"] 
}

variable "frontend_subnet_name" {
  description = "The name of the frontend subnet"
  type        = string
  default     = "frontend-subnet"
}

variable "backend_subnet_name" {
  description = "The name of the backend subnet"
  type        = string
  default     = "backend-subnet"
}
variable "address_prefix_frontend" {
  description = "The address prefix for the frontend subnet"
  default     = ["10.0.1.0/24"]
  type        = list(string)
}

variable "address_prefix_backend" {
  description = "The address prefix for the backend subnet"
  default     = ["10.0.2.0/24"]
  type        = list(string)
} 

variable "public_ip_frontend" {
  description = "The name of the public IP for the frontend"
  type        = string
  default     = "frontend-public-ip"
}

variable "public_ip_backend" {
  description = "The name of the public IP for the backend"
  type        = string
  default     = "backend-public-ip"
}
variable "allocation_method" {
  description = "The allocation method for the public IPs"
  type        = string
  default     = "Static"
}


variable "vm1_name" {
  description = "The name of the first virtual machine"
  type        = string
  default     = "vm1"
}

variable "vm1_size" {
  description = "The size of the first virtual machine"
  type        = string
  
}


variable "nic_name_frontend" {
  description = "The name of the network interface for the frontend"
  type        = string
  default     = "frontend-nic"
}

variable "vm1_publisher" {
  description = "The publisher of the VM1 image"
  type        = string
  default     = "Canonical"
}

variable "vm1_offer" {
  description = "The offer of the VM1 image"
  type        = string
  default     = "UbuntuServer"
}

variable "vm1_sku" {
  description = "The SKU of the VM1 image"
  type        = string
  default     = "18.04-LTS"
}

variable "vm1_version" {
  description = "The version of the VM1 image"
  type        = string
  default     = "latest"
}

variable "vm2_name" {
  description = "The name of the second virtual machine"
  type        = string
  default     = "vm2"
}

variable "vm2_size" {
  description = "The size of the second virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

  variable "nic_name_backend" {
  description = "The name of the network interface for the backend"
  type        = string
  default     = "backend-nic"
} 
variable "vm2_publisher" {
  description = "The publisher of the VM2 image"
  type        = string
  default     = "Canonical"
}
variable "vm2_offer" {
  description = "The offer of the VM2 image"
  type        = string
  default     = "UbuntuServer"
}
variable "vm2_sku" {
  description = "The SKU of the VM2 image"
  type        = string
  default     = "18.04-LTS"
}
variable "vm2_version" {
  description = "The version of the VM2 image"
  type        = string
  default     = "latest"
}

variable "mssqlserver_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "preprod-sql-server"
  
}
variable "sql_db_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "preprod-db"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "dbuser"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = "DbP@ssw0rd1993"
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
  default     = "preprod-nsg"
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "frontend-subnet"
}
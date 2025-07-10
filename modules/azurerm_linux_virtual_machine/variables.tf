
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "resource_group_location" {
  description = "The name of the network interface"
  type        = string
}
variable "nic_name" {
  description = "The name of the network interface"
  type        = string 
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "mySubnet"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "myVirtualNetwork"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "username_secret_name" {
  description = "The name of the secret in Azure Key Vault"
  type        = string
}

variable "password_secret_name" {
  description = "The name of the secret in Azure Key Vault"
  type        = string
}

variable "vm_publisher" {
  description = "The publisher of the virtual machine image"
  type        = string
}
variable "vm_offer" {
  description = "The offer of the virtual machine image"
  type        = string
}

variable "vm_sku" {
  description = "The SKU of the virtual machine image"
  type        = string
}
variable "vm_version" {
  description = "The version of the virtual machine image"
  type        = string
}
variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault"
  type        = string
  
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}
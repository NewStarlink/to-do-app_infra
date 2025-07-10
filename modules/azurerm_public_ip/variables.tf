variable "public_ip_name" {
    description = "The name of the Public IP"
    type        = string
    default     = "myPublicIP"
  
}

variable "resource_group_location" {
    description = "The location of the resource group"
    type        = string
    default     = "West Europe"

}

variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
    default     = "preprod-rg"

}
variable "allocation_method" {
    description = "The allocation method for the Public IP"
    type        = string
    default     = "Static"
}
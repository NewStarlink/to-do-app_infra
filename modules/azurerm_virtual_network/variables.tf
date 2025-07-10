variable "virtual_network_name" {
    description = "The name of the virtual network"
    type        = string
    default     = "myVirtualNetwork"
  
}

variable "address_space" {
    description = "The address space for the virtual network"
    type        = list(string)
    default     = ["    "]
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
variable "subnet_name" {
    description = "The name of the subnet"
    type        = string
    default     = "mySubnet"  
}

variable "address_prefixes" {
    description = "The address prefixes for the subnet"
    type        = list(string)
    default     = ["    "]
}

variable "virtual_network_name" {
    description = "The name of the virtual network"
    type        = string
    default     = "myVirtualNetwork"  
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
    default     = "preprod-rg"
  
}
variable "nsg_name" {
    description = "The name of the network security group"
    type        = string
    default     = "nsg-frontend"
}

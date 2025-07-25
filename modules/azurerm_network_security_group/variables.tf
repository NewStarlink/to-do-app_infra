variable "nsg_name" {
  description = "The name of the frontend network security group"
  type        = string

  
}
variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string

}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string

}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

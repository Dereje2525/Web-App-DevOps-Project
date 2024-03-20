variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}
variable "vnet_address_space"{
   type       = list(string)
   description = "Adress space for the Viertual Network"
   }

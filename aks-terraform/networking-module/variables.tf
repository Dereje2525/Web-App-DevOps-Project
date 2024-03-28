
variable "resource_group_name" {
  description = "The name of the created resource group."
  type        = string
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space  of the vnet"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "Address space of the subnet"
}
  
variable "location" {
  description = "Location of resource group"
  type = string
  
}  


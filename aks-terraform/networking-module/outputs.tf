output "networking_resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.network_pro.name 
}

output "vnet_id" {
  description = "The ID of the created virtual network."
  value       =  azurerm_virtual_network.vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the created subnet 1."
  value       = azurerm_subnet.ask_subnet_1.id
}

output "worker_node_subnet_id" {
  description = "TheID of the created subnet 2."
  value       =  azurerm_subnet.ask_subnet_2.id
}

output "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.network_pro.name
}
output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  value       = azurerm_network_security_group.nsg.id
}  

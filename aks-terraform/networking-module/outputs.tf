output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group_network_pro.name
}

output "vnet_id" {
  description = "The id of the created virtual network."
  value       =  azurerm_virtual_network.my_ask_net.id
}

output "control_plane_subnet_id" {
  description = "The name of the created subnet 1."
  value       = azurerm_subnet.ask_subnet_1.id
}

output "worker_node_subnet_id" {
  description = "The name of the created subnet 2."
  value       =  azurerm_subnet.ask_subnet_2.name
}
output "networking_resource_group_Name" {
  description = "The name of the created subnet 2."
  value       = azurerm_resource_group.network_pro.name 
  
}
output "aks_nsg_id" {
  description = "The name of the aks-nsg."
  value       = azurerm_network_security_group.nsg.id
  
}

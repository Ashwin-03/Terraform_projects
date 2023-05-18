output "myrg" {
  value = azurerm_resource_group.rg.name
}

output "myloc" {
  value = azurerm_resource_group.rg.location
}

output "mynic" {
  value = azurerm_network_interface.nic.id
}

output "mypubip" {
  value = azurerm_public_ip.pubip.id
}

output "myvm" {
  value = azurerm_virtual_machine.vm.name
}

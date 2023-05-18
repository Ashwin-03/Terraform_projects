output "myrg" {
  default = azurerm_resource_group.rg.name
}

output "myloc" {
  default = azurerm_resource_group.rg.location
}

output "mynic" {
  default = azurerm_network_interface.nic.id
}

output "mypubip" {
  default = azurerm_public_ip.pubip.id
}

output "myvm" {
  default = azurerm_virtual_machine.vm.name
}

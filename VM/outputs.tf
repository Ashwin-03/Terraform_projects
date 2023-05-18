output "myrg" {
  value = var.myrg
}

output "myloc" {
  value = var.mylocation
}

output "mynic" {
  value = azurerm_network_interface.nic.id
}

output "mypubip" {
  value = azurerm_public_ip.pubip.id
}

output "myvm" {
  value = azurerm_windows_virtual_machine.vm.name
}

output "rg_name" {
  value = azurerm_resource_group.name.my-rg.id
}

output "location" {
  value = azurerm_resource_group.location.my-rg.id
}

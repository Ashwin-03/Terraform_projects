terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0.2"
    }
  }
  backend "azurerm" {}
  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.myrg
  location = var.mylocation
}

resource "azurerm_virtual_network" "vnet" {
  name = var.myvnet
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name = var.mysubnet
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.2.1.0/24"]
}

resource "azurerm_public_ip" "pubip" {
  name = var.mypubip
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Dynamic"
  sku = "Basic"
}

resource "azurerm_network_interface" "nic" {
  name = var.mynic
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  ip_configuration {
    name = "ipconfig1"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pubip.id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name = var.myvm
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  network_interface_ids = [azurerm_network_interface.nic.id]
  size = "Standard_B1s"
  admin_username = "ashwin"
  admin_password = "321@Password"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2019-Datacenter"
    version = "latest"
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}


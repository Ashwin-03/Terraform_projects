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

resource "azurerm_resource_group" "myrg" {
  name = var.rgname
  location = var.location
}

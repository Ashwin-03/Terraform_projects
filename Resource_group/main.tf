terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0.2"
    }
  }
  backend "local" {}
  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my-rg"{
  name = var.resource_group_name
  location = var.location
}



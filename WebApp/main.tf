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

resource "azurerm_service_plan" "myasp1" {
  name = var.myasp-1
  resource_group_name = var.myrg
  location = var.mylocation

  sku_name = "F1"
  os_type = "Linux"
}

resource "azurerm_service_plan" "myasp2" {
  name = var.myasp-2
  resource_group_name = var.myrg
  location = var.mylocation
  
  sku_name = "F1"
  os_type = "Windows"
}

resource "azurerm_linux_web_app" "mylap" {
  name = var.mylapp
  resource_group_name = var.myrg
  location = var.mylocation
  service_plan_id = azurerm_service_plan.myasp1.id

  site_config {}
}

resource "azurerm_windows_web_app" "mywap" {
  name = var.mywapp
  resource_group_name = var.myrg
  location =  var.mylocation
  service_plan_id = azurerm_service_plan.myasp2.id

  site_config {}
}



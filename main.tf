terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RGDeployment-Test" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
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

resource "azurerm_resource_group" "example_rg" {
  name     = "example_rg"
  location = "East US" # Instead of Display name, otherway to write is just the name viz eastus in this case.
}
variable "azurerm_resource_group" {
  description = "The name of the ressource group"
  type = string
  default = "RGDeployment-Test"
}

variable "azurerm_location" {
    description = "The Azure region in which resources will be provisioned"
    type = string
    default = "eastus" # Instead of Name, otherway to write is just the Display Name viz East US in this case. 
}
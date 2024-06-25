output "resource_group_name" {
  value = "The name of the provisioned resource group is: ${azurerm_resource_group.RGDeployment-Test.name}"
}
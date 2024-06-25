variable "resource_group_name" {
  description = "The name of the ressource group"
}

variable "location" {
  description = "The Azure region in which resources will be provisioned"
}

variable "tags" {
  type = map(string)
}
resource "azurerm_resource_group" "rg" {
  name     = "RG-${local.name}"
  location = var.location
  tags     = var.tags

}

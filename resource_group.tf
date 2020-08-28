resource "azurerm_resource_group" "rg" {
  name      = var.az_rg
  location  = var.az_location
}

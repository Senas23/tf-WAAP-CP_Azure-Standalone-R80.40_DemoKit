resource "azurerm_virtual_network" "vnet" {
  name                = var.az_vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.az_vnet.address_space]
  location            = azurerm_resource_group.rg.location
}

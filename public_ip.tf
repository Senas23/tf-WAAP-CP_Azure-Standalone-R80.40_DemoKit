resource "azurerm_public_ip" "mgmt_pip" {
    name                = var.cp_mgmt.name
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Static"
}

resource "azurerm_public_ip" "ubuntu_pip" {
    name                = "ubuntupublic"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Dynamic"
}

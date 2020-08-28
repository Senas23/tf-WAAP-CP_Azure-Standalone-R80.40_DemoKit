resource "azurerm_network_interface" "mgmtexternal" {
    name                  = var.cp_mgmt_nic_ext.name
    location              = azurerm_resource_group.rg.location
    resource_group_name   = azurerm_resource_group.rg.name
    enable_ip_forwarding  = var.cp_mgmt_nic_ext.enable_ip_forwarding
	
    ip_configuration {
      name                          = "${var.cp_mgmt_nic_ext.name}Configuration"
      subnet_id                     = azurerm_subnet.External_subnet.id
      private_ip_address_allocation = var.cp_mgmt_nic_ext.ip_allocation
		  private_ip_address            = var.cp_mgmt_nic_ext.ip_address
      primary                       = true
		  public_ip_address_id          = azurerm_public_ip.mgmt_pip.id
    }
}

resource "azurerm_network_interface" "mgmtinternal" {
    name                  = var.cp_mgmt_nic_int.name
    location              = azurerm_resource_group.rg.location
    resource_group_name   = azurerm_resource_group.rg.name
    enable_ip_forwarding  = var.cp_mgmt_nic_int.enable_ip_forwarding
	
    ip_configuration {
      name                          = "${var.cp_mgmt_nic_int.name}Configuration"
      subnet_id                     = azurerm_subnet.Internal_subnet.id
      private_ip_address_allocation = var.cp_mgmt_nic_int.ip_allocation
		  private_ip_address            = var.cp_mgmt_nic_int.ip_address
    }
}

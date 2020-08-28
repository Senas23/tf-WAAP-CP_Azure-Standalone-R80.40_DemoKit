resource "azurerm_route_table" "DMZ1RT" {
  name                = var.az_rt
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  route {
    name           = "internal"
    address_prefix = var.az_vnet.address_space
    next_hop_type  = "vnetlocal"
  }
  
  route {
    name                    = "Internet"
    address_prefix          = "0.0.0.0/0"
    next_hop_type           = "VirtualAppliance"
	  next_hop_in_ip_address  = var.cp_mgmt_nic_int.ip_address
   }
  }

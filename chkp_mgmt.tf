# Create virtual machine and Accept the agreement for the mgmt-byol for R80.40
resource "azurerm_marketplace_agreement" "checkpoint" {
  publisher = var.az_mkt_cp_mgmt.publisher
  offer     = var.az_mkt_cp_mgmt.offer
  plan      = var.az_mkt_cp_mgmt.plan
}

resource "azurerm_virtual_machine" "chkpmgmt" {
    name                          = var.cp_mgmt.name
    location                      = azurerm_resource_group.rg.location
    resource_group_name           = azurerm_resource_group.rg.name
    network_interface_ids         = [azurerm_network_interface.mgmtexternal.id, azurerm_network_interface.mgmtinternal.id]
    primary_network_interface_id  = azurerm_network_interface.mgmtexternal.id
    vm_size                       = var.cp_mgmt.vm_size

    storage_os_disk {
        name              = "${var.cp_mgmt.name}_OSDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = var.az_mkt_cp_mgmt.publisher
        offer     = var.az_mkt_cp_mgmt.offer
        sku       = var.az_mkt_cp_mgmt.plan
        version   = var.az_mkt_cp_mgmt.version
    }

    plan {
        name      = var.az_mkt_cp_mgmt.plan
        publisher = var.az_mkt_cp_mgmt.publisher
        product   = var.az_mkt_cp_mgmt.product
        }

    os_profile {
        computer_name   = var.cp_mgmt.name
        admin_username  = var.cp_mgmt.admin_username
        admin_password  = var.cp_mgmt.admin_password
        custom_data     = file("${var.cp_mgmt.custom_data}") 
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }
    
    depends_on = [azurerm_marketplace_agreement.checkpoint]
}

resource "azurerm_network_interface" "ubuntu-external-main" {
  name                = var.ubuntu_ext_nic_ext.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = ${var.ubuntu_ext_nic_ext.name}"Configuration"
    subnet_id                     = azurerm_subnet.External_subnet.id
    private_ip_address_allocation = var.ubuntu_ext_nic_ext.ip_allocation
    private_ip_address            = var.ubuntu_ext_nic_ext.ip_address
    primary                       = true
		public_ip_address_id          = azurerm_public_ip.ubuntu_pip.id
  }
}

resource "azurerm_virtual_machine" "ubuntu-external" {
  name                  = var.ubuntu_ext.name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.ubuntu-external-main.id]
  vm_size               = var.ubuntu_ext.vm_size

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.az_mkt_ubuntu_ext.publisher
    offer     = var.az_mkt_ubuntu_ext.offer
    sku       = var.az_mkt_ubuntu_ext.plan
    version   = var.az_mkt_ubuntu_ext.version
  }

  storage_os_disk {
    name              = "${var.ubuntu_ext}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.ubuntu_ext.name
    admin_username = var.ubuntu_ext.admin_username
    admin_password = var.ubuntu_ext.admin_password
    custom_data = file("${var.ubuntu_ext.custom_data}") 
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
variable "az_mkt_cp_mgmt" {
    type = map(string)
    description = "Azure Marketplace CHKP info"
    default = {
        publisher = "checkpoint"
        offer     = "check-point-cg-r8040"
        plan      = "mgmt-byol"
        version   = "latest"
        product   = "check-point-cg-r8040"
    }
}

variable "cp_mgmt" {
  type        = map(string)
  description = "CHKP Management Marketplace info"
  default     = {
    name            = "r80dot40mgmt"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "azureuser"
    admin_password  = "Cpwins1!!"
    custom_data     = "customdata.sh"
  }
}

variable "cp_mgmt_nic_ext" {
  type = map(string)
  description = "CHKP Management NIC External info"
  default = {
    name                  = "mgmt_external"
    enable_ip_forwarding  = "true"
    ip_allocation         = "Static"
    ip_address            = "10.95.0.10"
  }
}

variable "cp_mgmt_nic_int" {
  type = map(string)
  description = "CHKP Management NIC Internal info"
  default = {
    name                  = "mgmt_internal"
    enable_ip_forwarding  = "true"
    ip_allocation         = "Static"
    ip_address            = "10.95.1.10"
  }
}

variable "az_location" {
    type        = string
    description = "Azure location"
    default     = "Central US"
}

variable "az_rg" {
    type        = string
    description = "Azure Resource Group name"
    default     = "R80dot40Standalone"
}

variable "az_vnet" {
  type = map(string)
  description = "Azure VNet"
  default = {
    name          = "R80dot40vnet"
    address_space = "10.95.0.0/20"
  }
}

variable "az_rt" {
  type = string
  description = "Azure Route Table"
  default     = "DMZ1RT"
}

variable "az_mkt_ubuntu_ext" {
    type = map(string)
    description = "Azure Marketplace Ubuntu"
    default = {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        plan      = "18.04-LTS"
        version   = "latest"
    }
}

variable "ubuntu_ext" {
  type        = map(string)
  description = "CHKP Management Marketplace info"
  default     = {
    name            = "ubuntu-external-vm"
    vm_size         = "Standard_B1ms"
    admin_username  = "chkpuser"
    admin_password  = "Cpwins1!"
    custom_data     = "ubuntu_meta_customdata.sh"
  }
}

variable "ubuntu_ext_nic_ext" {
  type = map(string)
  description = "Ubuntu External NIC External info"
  default = {
    name                  = "ubuntu-external-nic"
    enable_ip_forwarding  = "true"
    ip_allocation         = "Static"
    ip_address            = "10.95.0.100"
  }
}

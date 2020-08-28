# Output the public ip of the gateway
output "CP_Mgmt_PIP" {
    value = azurerm_public_ip.mgmt_pip.ip_address
}
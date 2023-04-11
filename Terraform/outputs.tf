output "storageaccountendpoint" {
  value = azurerm_storage_account.example.primary_blob_endpoint
}

output "virtualnetwork_address" {
  value = azurerm_virtual_network.example.address_space
}

output "subnet_address" {
  value = azurerm_subnet.example.address_prefixes
}

output "vmpublip" {
  value = azurerm_public_ip.example.ip_address
}
output "storageaccountendpoint" {
  value = azurerm_storage_account.example.primary_blob_endpoint
}

output "vmpublip" {
  value = azurerm_public_ip.example.ip_address
}

output "resource_group_id" {
  value = data.azurerm_resource_group.rg1.id
}

output "virtual_network_id" {
  value = data.azurerm_virtual_network.example.id
}

output "subnet_id" {
  value = data.azurerm_subnet.example.id
}

output "vault_uri" {
  value = data.azurerm_key_vault.example.vault_uri
}
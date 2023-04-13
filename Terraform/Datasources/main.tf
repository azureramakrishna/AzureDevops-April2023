terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "ce1425fc-f3d9-4afa-a1df-9786245f41fc"
  client_secret   = ""
  tenant_id       = "459865f1-a8aa-450a-baec-8b47a9e5c904"
  subscription_id = "6e4924ab-b00c-468f-ae01-e5d33e8786f8"
}

# Azure backend state
terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg10032000825eeb72"
    container_name       = "tfstate"
    key                  = "data.terraform.tfstate"
  }
}

# Create a resource group
# resource "azurerm_resource_group" "rg1" {
#   name     = var.resource_group_name
#   location = var.location
# }

# Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg1.name
  location                 = data.azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Create a Virtual Network
# resource "azurerm_virtual_network" "example" {
#   name                = var.virtual_network_name
#   location            = azurerm_resource_group.rg1.location
#   resource_group_name = azurerm_resource_group.rg1.name
#   address_space       = var.virtual_network_address
# }

# Creaet Subnet
# resource "azurerm_subnet" "example" {
#   name                 = var.subnet_name
#   resource_group_name  = azurerm_resource_group.rg1.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = var.subnet_address
# }


# Create Network security group
resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.rg1.location
  resource_group_name = data.azurerm_resource_group.rg1.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# NSG and Subnet association
resource "azurerm_subnet_network_security_group_association" "example" {
  depends_on = [
    azurerm_network_security_group.example
  ]
  subnet_id                 = data.azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

# Create a public ip
resource "azurerm_public_ip" "example" {
  name                = var.publicip_name
  resource_group_name = data.azurerm_resource_group.rg1.name
  location            = data.azurerm_resource_group.rg1.location
  allocation_method   = "Static"
}

# Create the NIC
resource "azurerm_network_interface" "example" {
  depends_on = [
    azurerm_public_ip.example
  ]
  name                = var.nic_name
  location            = data.azurerm_resource_group.rg1.location
  resource_group_name = data.azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

# Create a windows VM
resource "azurerm_windows_virtual_machine" "example" {
  depends_on = [
    azurerm_network_interface.example,
    azurerm_storage_account.example
  ]
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.rg1.name
  location            = data.azurerm_resource_group.rg1.location
  size                = var.virtual_machine_size
  admin_username      = var.adminUser
  admin_password      = data.azurerm_key_vault_secret.example.value
  #zone               = 1
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

# Create a data disk
resource "azurerm_managed_disk" "example" {
  name                 = "${var.virtual_machine_name}-disk1"
  location             = data.azurerm_resource_group.rg1.location
  resource_group_name  = data.azurerm_resource_group.rg1.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

# Associate datadisk to VM
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_windows_virtual_machine.example.id
  lun                = "10"
  caching            = "ReadWrite"
}
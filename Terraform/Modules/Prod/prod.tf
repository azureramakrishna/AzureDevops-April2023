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
    key                  = "prodmodule.terraform.tfstate"
  }
}

module "prod" {

  source = "../"

  resource_group_name     = "prod_group"
  location                = "UKSouth"
  storage_account_name    = "tfprodsa20230418"
  virtual_network_name    = "prod-vnet"
  virtual_network_address = ["172.16.2.0/24"]
  subnet_name             = "prod-snet"
  subnet_address          = ["172.16.2.0/25"]
  nsg_name                = "prod-nsg"
  publicip_name           = "prod-pubip"
  nic_name                = "prod-nic"
  virtual_machine_name    = "prod-vm"
  virtual_machine_size    = "Standard_B2s"
  adminUser               = "azureuser"
  adminPassword           = "Azuredevops@12345"
}
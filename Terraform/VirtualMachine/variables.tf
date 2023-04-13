variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "terraform_group"
}


variable "location" {
  type        = string
  description = "location of the resource group"
  default     = "UKSouth"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
  default     = "terraformsa20230410"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "terraform-vnet"
}

variable "virtual_network_address" {
  type        = list
  description = "IP Address of the virtual network"
  default     = ["172.16.0.0/24", "192.168.0.0/24"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = "terraform-snet"
}

variable "subnet_address" {
  type        = list
  description = "IP Address of the subnet"
  default     = ["172.16.0.0/24"]
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
  default     = "terraform-nsg"
}

variable "publicip_name" {
  type        = string
  description = "Name of the publicip"
  default     = "terraform-pubip"
}

variable "nic_name" {
  type        = string
  description = "Name of the NIC"
  default     = "terraform-nic"
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "terraform-vm"
}

variable "virtual_machine_size" {
  type        = string
  description = "size of the virtual machine"
  default     = "Standard_B2s"
}

variable "adminUser" {
  type        = string
  default     = "azureuser"
}

variable "adminPassword" {
  type        = string
  default     = "P@$$w0rd1234!"
}
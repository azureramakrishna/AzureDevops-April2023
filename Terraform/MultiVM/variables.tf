variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Name of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "virtual_network_address" {
  type        = list(any)
  description = "IP Address of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_address" {
  type        = list(any)
  description = "IP Address of the subnet"
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
}

variable "publicip_name" {
  type        = string
  description = "Name of the publicip"
}

variable "nic_name" {
  type        = string
  description = "Name of the NIC"
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "virtual_machine_size" {
  type        = string
  description = "size of the virtual machine"
}

variable "adminUser" {
  type = string
}

# variable "adminPassword" {
#   type        = string
#   default     = "P@$$w0rd1234!"
# }

variable "count_value" {
  type = number
}
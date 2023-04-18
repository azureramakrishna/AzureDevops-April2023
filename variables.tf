variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "count_value" {
  type        = number
  description = "number of storage accounts"
}

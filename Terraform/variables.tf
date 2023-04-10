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
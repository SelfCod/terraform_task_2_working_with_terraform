variable "resource_group_name" {
  type    = string
  default = "my-storage-rg"
  description = "The name of the resource group"
}

variable "location" {
  type    = string
  default = "West Europe"
  description = "The Azure region to deploy resources"
}

variable "storage_account_name" {
  type    = string
  default = "mystorageaccount001" # Ensure this is globally unique
  description = "The name of the storage account"
}

variable "container_name" {
  type    = string
  default = "code-archive"
  description = "The name of the storage container"
}

variable "blob_name" {
  type    = string
  default = "terraform-code.zip"
  description = "The name of the storage blob"
}
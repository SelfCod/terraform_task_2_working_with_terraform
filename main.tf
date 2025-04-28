data "archive_file" "code_archive" {
  type        = "zip"
  source_dir  = path.module
  output_path = "terraform-code.zip" # Ensure this path is writable
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoraccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                    = var.blob_name
  storage_account_name    = azurerm_storage_account.example.name
  storage_container_name  = azurerm_storage_container.example.name
  type                    = "Block"
  source                  = data.archive_file.code_archive.output_path
}
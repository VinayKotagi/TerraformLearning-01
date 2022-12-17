provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "AzKotagiresource" {
  name     = var.resourceName
  location = var.resourceLocation
  tags =var.kotagitag
}

resource "azurerm_storage_account" "AZStorageName" {
  name = var.storagename
  resource_group_name      = azurerm_resource_group.AzKotagiresource.name
  location                 = azurerm_resource_group.AzKotagiresource.location
  account_tier             = "Standard" 
  account_replication_type = "GRS"

  tags = var.kotagitag
}

resource "azurerm_storage_container" "KotagiAZStorageContainer" {
  name                  = var.AZContainer
  storage_account_name  = azurerm_storage_account.AZStorageName.name
  container_access_type = "private"
}
provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rsgr" {
  name     = var.nombre_rg
  location = var.locations_code
}
resource "azurerm_storage_account" "stac" {
  name                     = var.name_stac
  resource_group_name      = azurerm_resource_group.rsgr.name
  location                 = azurerm_resource_group.rsgr.location
  account_tier             = "Standard"
  account_replication_type = var.replication

  tags = {
    environment = "staging"
    tribu = "rock"
  }
}
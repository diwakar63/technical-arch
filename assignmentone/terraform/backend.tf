terraform {
  backend "azurerm" {
    storage_account_name = "sa"
    container_name       = "appcontiner"
    key                  = "app.key"
    resource_group_name  = "rg"
    subscription_id      = "subscription_id"
  }
}

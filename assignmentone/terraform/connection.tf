terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      version = "= 2.52.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

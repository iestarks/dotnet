terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-storage"
    storage_account_name = "tfstorageaccountbackend"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
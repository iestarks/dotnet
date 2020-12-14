provider "azurerm" {
  version = "=2.40.0"
 features {}  // Required to use Azure
}

resource "azurerm_resource_group" "terraform_az_test" {
name = "tfmainrg"
location = "eastus"  
}

resource "azurerm_container_group" "tfcg_test" {
    name          = "weatherapi"
    location      = azurerm_resource_group.terraform_az_test.location
    resource_group_name = azurerm_resource_group.terraform_az_test.name

    ip_address_type = "public"
    dns_name_label = "istarks"
    os_type         = "Linux"

    container {
         name = "weatherapi"
         image = "istarks/weatherapi"
         cpu  = "1"
         memory = "1"

         ports {
           port = 80
           protocol = "TCP"
         }

    }
  
}
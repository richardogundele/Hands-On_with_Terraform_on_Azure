terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "test-ro"

    workspaces {
      name = "Hands-On_with_Terraform_on_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = true
}

# resource "azurerm_resource_group" "rg" {
#   name     = "813-d12c9b58-hands-on-with-terraform-on-azure"
#   location = "South Central US"
# }

module "firstrelease" {
  source               = "app.terraform.io/Test-ro/firstrelease/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "morountodun"
}
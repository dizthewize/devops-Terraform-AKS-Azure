terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "product" {
  name     = "product-resources"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "product" {
  name                = "product-network"
  resource_group_name = azurerm_resource_group.product.name
  location            = azurerm_resource_group.product.location
  address_space       = ["10.0.0.0/16"]
}

module "aks" {
  source = "./modules/aks"
  resource_group_name = azurerm_resource_group.product.name
  location = azurerm_resource_group.product.location
}

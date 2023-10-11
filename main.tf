provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "examplemibanco" {
  name     = "example-resourcesmibanco"
  location = "West Europe"
}

resource "azurerm_service_plan" "exampleserviceplanmibanco" {
  name                = "exampleplanmibanco"
  resource_group_name = azurerm_resource_group.examplemibanco.name
  location            = azurerm_resource_group.examplemibanco.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "examplewebappmibanco" {
  name                = "examplewebappmibanco"
  resource_group_name = azurerm_resource_group.examplemibanco.name
  location            = azurerm_service_plan.exampleserviceplanmibanco.location
  service_plan_id     = azurerm_service_plan.exampleserviceplanmibanco.id

  site_config {}
}

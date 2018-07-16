resource "azurerm_resource_group" "az_vn" {
  name     = "vn_terraform"
  location = "westus"
}

resource "azurerm_virtual_network" "vnTerraform" {
  address_space       = ["10.0.0.0/16"]
  location            = "West Europe"
  name                = "vnTerraform"
  resource_group_name = "${azurerm_resource_group.az_vn.name}"
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags {
    environment = "terraformdev"
  }
}

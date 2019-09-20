resource "azurerm_resource_group" "kv" {
  name     = "${var.kv_resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_key_vault" "kv" {
  name                        = "${var.kv_name}"
  location                    = "${azurerm_resource_group.kv.location}"
  resource_group_name         = "${azurerm_resource_group.kv.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = "${var.tenant_id}"

  sku_name = "standard"

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}
resource "azurerm_resource_group" "aks" {
  name     = "${var.aks_resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.aks.location}"
  resource_group_name = "${azurerm_resource_group.aks.name}"
  dns_prefix          = "${var.dns_prefix}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = "${var.agent_count}"
    vm_size         = "Standard_B2ms"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

}

resource "null_resource" "cluster_credentials" {
  provisioner "local-exec" {
    command = "if [ ! -e ${var.output_directory} ]; then mkdir -p ${var.output_directory}; fi && echo \"${azurerm_kubernetes_cluster.aks.kube_config_raw}\" > ${var.output_directory}/${var.kubeconfig_filename}"
  }

  depends_on = ["azurerm_kubernetes_cluster.aks"]
}
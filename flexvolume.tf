module "keyvault_flexvolume_role" {
  source = "github.com/microsoft/bedrock?ref=master//cluster/azure/keyvault_flexvol_role"

  resource_group_name  = "${var.kv_resource_group_name}"
  service_principal_id = "${var.client_id}"
  subscription_id      = "${var.subscription_id}"
  keyvault_name        = "${var.kv_name}"
  enable_flexvol       = "${var.enable_flexvol_role}"
}

module "flex_volume" {
  source = "github.com/microsoft/bedrock?ref=master//cluster/azure/keyvault_flexvol"

  resource_group_name      = "${var.kv_resource_group_name}"
  service_principal_id     = "${var.client_id}"
  service_principal_secret = "${var.client_secret}"
  tenant_id                = "${var.tenant_id}"
  keyvault_name            = "${var.kv_name}"

  output_directory         = "${var.output_directory}"
  kubeconfig_filename      = "${var.kubeconfig_filename}"
  enable_flexvol           = "${var.enable_flexvol}"

  kubeconfig_complete = "${module.aks_cluster.kubeconfig_done}"
}
module "aks_cluster" {
  source = "./modules/aks"

  cluster_name        = "${var.cluster_name}"
  location            = "${var.location}"
  aks_resource_group_name = "${var.aks_resource_group_name}"
  dns_prefix          = "${var.dns_prefix}"
  client_id     = "${var.client_id}"
  client_secret = "${var.client_secret}"
  ssh_public_key = "${var.ssh_public_key}"
  agent_count = "${var.agent_count}"
  kubeconfig_filename = "${var.kubeconfig_filename}"
  output_directory = "${var.output_directory}"

}

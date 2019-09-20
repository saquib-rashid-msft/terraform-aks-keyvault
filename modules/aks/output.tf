output "kubeconfig_done" {
  value = "${join("",null_resource.cluster_credentials.*.id)}"
}
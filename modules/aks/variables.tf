variable "client_id" {

}
variable "client_secret" {

}
variable aks_resource_group_name {
  default = "aks_rg"
}

variable location {
  default = "East US"
}


variable "cluster_name" {
  default = "aks_cluster"
}

variable "dns_prefix" {
  default = "akstest"
}

variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable kubeconfig_filename {
  default = "kube_config"
}

variable "output_directory" {
  default = "~/.kube"
}


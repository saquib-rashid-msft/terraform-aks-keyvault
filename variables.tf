variable "tenant_id" {
}

variable "subscription_id" {
  
}

variable "client_id" {

}
variable "client_secret" {

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

variable aks_resource_group_name {
  default = "aks_rg"
}

variable location {
  default = "East US"
}

variable kv_resource_group_name {
  default = "kv_rg"
}

variable kv_name {
  default = "testvault"
  # value may only contain alphanumeric characters and dashes and must be between 3-24 chars
}

variable kubeconfig_filename {
  default = "kube_config"
}

variable "output_directory" {
  default = "~/.kube"
}

variable "enable_flexvol_role" {
  default = "true"
}

variable "enable_flexvol" {
  default = "true"
}




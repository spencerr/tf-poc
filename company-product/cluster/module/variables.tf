variable "resource_group_name" {
  description = "The name of the Azure resource group where AKS will be created."
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed."
  default     = "East US" # You can change the default or provide it when calling the module
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  default     = "tfpoc-aks" # You can change the default or provide it when calling the module
}

variable "node_pool" {
  description = "Configuration for the default node pool."

  default = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}
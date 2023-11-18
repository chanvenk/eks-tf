variable "region" {
    type = string
    description = "Region in which the EKS cluster needs to be deployed"
}

variable "subnet_ids" {
    type = list(string)
    description = "The subnet ID in which the EKS cluster needs to have its worker nodes"
}

variable "cluster_name" {
    type = string
    description = "Name of the EKS Cluster"
}



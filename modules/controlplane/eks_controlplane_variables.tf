variable "subnet_ids" {
    type = list(string)
    description = "The subnet ID in which the EKS cluster needs to have its worker nodes"
}

variable "cluster_name" {
    type = string
    description = "Name of the EKS Cluster"
}

variable "cluster_aws_role" {
    type = string
    description = "Role ARN of the EKS Cluster Role"
}

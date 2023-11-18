variable "desired_size" {
    type = number
    description = "Desired nubmer of nodes in the worker nodegroup"
    default = 1
}
variable "min_size" {
    type = number
    description = "Minimum nubmer of nodes in the worker nodegroup"
    default = 0
}

variable "max_size" {
    type = number
    description = "Maximum number of nodes in the worker nodegroup"
    default = 2
}

variable "max_unavailable" {
    type = number
    description = "Maximum number of unavailable nodes during update"
    default = 1
}

variable "eks_version" {
    type = string
    description = "Kubernetes version"
}

variable "worker_aws_role" {
    type = string
    description = "Role ARN of the worker node group"
}

variable "cluster_name" {
    type = string
    description = "Name of the EKS Cluster"
}

variable "subnet_ids" {
    type = list(string)
    description = "The subnet ID in which the EKS cluster needs to have its worker nodes"
}

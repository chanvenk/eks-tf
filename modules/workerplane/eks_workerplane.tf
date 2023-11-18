data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${var.eks_version}/amazon-linux-2/recommended/release_version"
}

resource "aws_eks_node_group" "eks_workerplane" {
  cluster_name    = var.cluster_name
  node_group_name = format("%s%s",var.cluster_name,"-worker-nodegroup")
  node_role_arn   = var.worker_aws_role
  subnet_ids      = var.subnet_ids
  version = var.eks_version
  release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)
  capacity_type = "SPOT"

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = var.max_unavailable
  }
}
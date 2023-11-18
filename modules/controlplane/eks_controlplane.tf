resource "aws_eks_cluster" "test_cluster" {
    name = var.cluster_name
    role_arn = var.cluster_aws_role
    vpc_config{
        subnet_ids = var.subnet_ids
    }
}


output "eks_cluster_out" {
    value = aws_eks_cluster.test_cluster.endpoint
}

output eks_cluster_version {
    value = aws_eks_cluster.test_cluster.version
}
output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.test_cluster.certificate_authority[0].data
}
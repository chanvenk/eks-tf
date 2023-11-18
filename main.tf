module "iam_aws_eks" {
    source = "./modules/iam"
}

module "eks_controlplane" {
    source = "./modules/controlplane"
    cluster_name = var.cluster_name
    subnet_ids = var.subnet_ids
    cluster_aws_role = module.iam_aws_eks.eksclusterrole_out
}
module "eks_workerplane" {
    source = "./modules/workerplane"
    eks_version = module.eks_controlplane.eks_cluster_version
    worker_aws_role = module.iam_aws_eks.eksworkerrole_out
    cluster_name = var.cluster_name
    subnet_ids = var.subnet_ids
}

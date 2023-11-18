resource "aws_iam_role" "eksworkerrole" {
  name = "EKSWorkerRole"
  assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
         }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "attach_EKS_WorkerNodePolicy" {
  role       = aws_iam_role.eksworkerrole.name
  for_each = toset(["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
              "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
              "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"])
  policy_arn = each.value
}

output "eksworkerrole_out" {
    value = aws_iam_role.eksworkerrole.arn
}


resource "aws_iam_role" "eksclusterrole" {
  name = "EKSClusterRole"
  assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
         }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "attach_EKS_ClusterPolicy" {
  role       = aws_iam_role.eksclusterrole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

output "eksclusterrole_out" {
    value = aws_iam_role.eksclusterrole.arn
}

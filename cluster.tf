#
# main EKS terraform resource definition
#
resource "aws_eks_cluster" "eks-cluster" {
  name = "${var.cluster-name}"

  role_arn = "${aws_iam_role.eks-role.arn}"

  vpc_config {
    subnet_ids = ["${module.eks-vpc.public_subnets}"]
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.eks-cluster.endpoint}"
}

output "kubeconfig-certificate-authority-data" {
  value = "${aws_eks_cluster.eks-cluster.certificate_authority.0.data}"
}

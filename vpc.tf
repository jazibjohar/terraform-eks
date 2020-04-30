#
module "eks-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.23.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = "${var.aws_azs}"
  private_subnets = "${var.eks-private-cidrs}"
  public_subnets  = "${var.eks-public-cidrs}"

  enable_nat_gateway = false
  single_nat_gateway = true

  enable_vpn_gateway = false

  enable_dns_hostnames = true

  tags = {
    Terraform                                   = "true"
    Environment                                 = "${var.environment_name}"
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  security_group_id = "${module.eks-vpc.default_security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_guestbook" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "TCP"
  security_group_id = "${module.eks-vpc.default_security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

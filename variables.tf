variable "aws_azs" {
  description = "AWS availability zones"
  type        = "list"
}

variable "eks-region" {
  description = "EKS Region"
}

variable "eks-private-cidrs" {
  description = "Private CIDRS"
  type        = "list"
}

variable "eks-public-cidrs" {
  description = "Public CIDRS"
  type        = "list"
}

variable "environment_name" {
  description = "Enviornment"
}

variable "cluster-name" {
  description = "Cluster name"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "ecommerce"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "db_name" {
  type    = string
  default = "ecommerce"
}

variable "db_username" {
  type    = string
  default = "ecommerce_admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "eks_cluster_name" {
  type    = string
  default = "ecommerce-eks"
}

variable "eks_node_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "eks_node_min_size" {
  type    = number
  default = 2
}

variable "eks_node_max_size" {
  type    = number
  default = 4
}

variable "eks_node_desired_size" {
  type    = number
  default = 2
}

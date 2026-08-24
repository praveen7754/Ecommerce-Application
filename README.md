# Ecommerce CI + AWS Infrastructure

Single repository containing:
- GitHub Actions CI for 10 Docker microservices
- Terraform infrastructure for AWS
- ECR repositories for all services
- VPC, public/private subnets, NAT, security groups
- EKS cluster and managed node group
- RDS MySQL
- ElastiCache Redis
- CloudWatch log group
- S3 Terraform remote state (existing bucket)

AWS region: us-east-1
AWS account: 743320495203

## Required AWS/GitHub setup

Create/keep the GitHub OIDC provider:
token.actions.githubusercontent.com

Use this single IAM role:
arn:aws:iam::743320495203:role/GitHubActions-Ecommerce

Trust relationship must allow BOTH repositories:
- repo:praveen7754/Ecommerce-Application:ref:refs/heads/main
- repo:praveen7754/Ecommerce-Infrastructure:ref:refs/heads/main

The role needs Terraform permissions for the resources in this repository plus ECR push permissions.

## Required GitHub repository variables

No long-lived AWS access keys are required.

Recommended repository variable:
AWS_REGION=us-east-1

For RDS password, set a GitHub Actions secret:
DB_PASSWORD
and pass it to Terraform as TF_VAR_db_password.

## What happens on push

1. Terraform workflow authenticates to AWS using OIDC.
2. Terraform creates/updates VPC, EKS, RDS, Redis, ECR, CloudWatch and related resources.
3. CI workflow builds each service and pushes its image to the corresponding ECR repository.

The CD/deployment-to-EKS stage is intentionally NOT included yet.

AWS EKS Platform (Enterprise Terraform & GitHub Actions)

Personal Project

Designed and built an enterprise-inspired AWS EKS platform using Infrastructure as Code and CI/CD best practices.

Key highlights:

Built a modular Terraform architecture for AWS infrastructure, including VPC, IAM, KMS, EKS Cluster, and Managed Node Groups.
Implemented remote Terraform state using Amazon S3 with DynamoDB state locking.
Designed an enterprise-style GitHub Actions CI/CD workflow with:
Automated Terraform validation and planning
Plan artifact storage
Manual approval before infrastructure deployment
Controlled apply and destroy workflows
Configured GitHub OIDC authentication to AWS, eliminating long-lived access keys.
Followed GitOps-ready repository structure to support future Kubernetes application deployments.
Implemented branch-based development using feature branches, pull requests, code reviews, and protected main branch.
Designed the platform with private worker nodes, high availability across multiple Availability Zones, and reusable Terraform modules.
Focused on production-oriented DevOps practices including infrastructure automation, security, and change management.

Technologies
AWS • Amazon EKS • Terraform • GitHub Actions • IAM • VPC • KMS • S3 • DynamoDB • OIDC • Git • Linux • Kubernetes

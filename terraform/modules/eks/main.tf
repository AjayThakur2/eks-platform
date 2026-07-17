resource "aws_eks_cluster" "this" {

  name = var.cluster_name

  version = var.kubernetes_version


  role_arn = var.cluster_role_arn


  access_config {

    authentication_mode = "API_AND_CONFIG_MAP"

    bootstrap_cluster_creator_admin_permissions = true

  }

  vpc_config {

    subnet_ids = var.private_subnet_ids


    endpoint_private_access = true

    endpoint_public_access = true

  }


  encryption_config {

    provider {

      key_arn = var.kms_key_arn

    }

    resources = [
      "secrets"
    ]

  }


  tags = {

    Environment = var.environment

    Terraform = "true"

  }

}


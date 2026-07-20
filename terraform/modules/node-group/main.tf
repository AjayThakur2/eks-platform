
resource "aws_launch_template" "this" {

  name_prefix = "${var.node_group_name}-"

  update_default_version = true

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = var.disk_size

      volume_type = var.volume_type

      encrypted = true

      kms_key_id = var.kms_key_arn

      delete_on_termination = true

    }

  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2

  }

  tag_specifications {

    resource_type = "instance"

    tags = {

      Environment = var.environment

      Terraform = "true"

    }

  }

}


resource "aws_eks_node_group" "this" {

  cluster_name = var.cluster_name

  node_group_name = var.node_group_name

  node_role_arn = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  capacity_type = var.capacity_type

  launch_template {

    id = aws_launch_template.this.id

    version = aws_launch_template.this.latest_version

  }


  instance_types = [
    var.instance_type
  ]


  scaling_config {

    desired_size = var.desired_size

    max_size = var.max_size

    min_size = var.min_size

  }


  update_config {

    max_unavailable = 1

  }


  labels = {

    Environment = var.environment

    NodeGroup = var.node_group_name

  }


  tags = {

    Environment = var.environment

    Terraform = "true"

  }

}

variable "cluster_name" {

  type = string

}


variable "node_group_name" {

  type = string

}


variable "node_role_arn" {

  type = string

}


variable "private_subnet_ids" {

  type = list(string)

}


variable "instance_type" {

  type = string

  default = "t3.small"

}


variable "desired_size" {

  type = number

  default = 1

}


variable "min_size" {

  type = number

  default = 1

}


variable "max_size" {

  type = number

  default = 2

}


variable "environment" {

  type = string

}

variable "kms_key_arn" {

  type = string

}

variable "capacity_type" {

  description = "Capacity type for the managed node group"

  type = string

  default = "ON_DEMAND"

}

variable "disk_size" {

  description = "Root EBS volume size in GiB"

  type = number

  default = 20

}

variable "volume_type" {

  description = "Root EBS volume type"

  type = string

  default = "gp3"

}



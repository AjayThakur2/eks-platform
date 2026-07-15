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

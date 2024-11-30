

#---------------------------------------------------
#  Amazon EMR Cluster
#---------------------------------------------------

variable "name" {
  description = "The name of the EMR cluster"
}

variable "release_label" {
  description = "The release_label of the EMR cluster"
}

variable "applications" {
  description = "A list of applications bundle to be used in AWS EMR"
  type        = list(string)
}

variable "termination_protection" {
  description = "termination_protection for EMR cluster"
}

variable "keep_job_flow_alive_when_no_steps" {
  description = " "
}

variable "subnet_id" {
  description = "subnet_id of the EMR cluster"
}

variable "key_name" {
  description = "key_name the additional_info of the EMR cluster"
}

variable "emr_managed_master_security_group" {}
variable "emr_managed_slave_security_group" {}
variable "master_instance_name" {}
variable "master_instance_type" {}
variable "master_ebs_config_volumes_per_instance" {}
variable "master_ebs_config_size" {}
variable "master_ebs_config_type" {}
variable "core_instance_name" {}
variable "slave_instance_type" {}
variable "slave_instance_count" {}
variable "slave_ebs_config_size" {}
variable "slave_ebs_config_type" {}
variable "slave_ebs_config_volumes_per_instance" {}
variable "additional_info" {
  description = "JSON string for selecting additional features such as adding proxy information. Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider, therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform"
  type        = string
  default     = null
}
variable "emr_cluster_tagname" {}
variable "ec2_instance_role" {}
variable "assume_role_policy_ec2" {}
variable "emr-instance-profile" {}
variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = false
}
variable "create_autoscaling_iam_role" {
  description = "Determines whether the autoscaling IAM role should be created"
  type        = bool
  default     = false
}
variable "autoscaling_iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}
variable "autoscaling_iam_role_arn" {
  description = "The ARN of an existing IAM role to use for autoscaling"
  type        = string
  default     = null
}
variable "core_instance_fleet" {
  description = "Configuration block to use an [Instance Fleet](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html) for the core node type. Cannot be specified if any `core_instance_group` configuration blocks are set"
  type        = any
  default     = {}
}
variable "master_instance_fleet" {
  description = "Configuration block to use an [Instance Fleet](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-instance-fleet.html) for the master node type. Cannot be specified if any `master_instance_group` configuration blocks are set"
  type        = any
  default     = {}
}
#---------------------------------------------------
# IAM role for Amazon EMR
#---------------------------------------------------

variable "emr_role_name" {}
variable "assume_role_policy" {}
variable "emr_policy_attachment" {}
variable "autoscaling_name" {}
variable "iam_role_use_name_prefix" {}
variable "iam_role_path" {}
variable "autoscaling_iam_role_description" {}
variable "autoscaling_assume_role_policy" {}
variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}
variable "iam_role_permissions_boundary" {}
variable "iam_user_name" {}

#---------------------------------------------------
# Security group for Amazon EMR
#---------------------------------------------------

variable "emr_master_sg" {}
variable "master_sg_description" {}

variable "vpc_id" {
  description = "The ID of the VPC where the EMR cluster will be launched"
}

variable "ingress_from_port_master" {}
variable "ingress_to_port_master" {}
variable "protocol_master" {}
variable "cidr_blocks_master" {}
variable "emr_slave_sg" {}
variable "slave_sg_description" {}
variable "ingress_from_port_slave" {}
variable "ingress_to_port_slave" {}
variable "protocol_slave" {}

#---------------------------------------------------
# S3 for Amazon EMR
#---------------------------------------------------

variable "bucket" {
  description = "The name of the S3 bucket to store EMR logs and results"
}









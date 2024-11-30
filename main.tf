# main.tf

#---------------------------------------------------
#  Amazon EMR Cluster
#---------------------------------------------------
locals {
  # Autoscaling not supported when using instance fleets
  create_autoscaling_iam_role = var.create && var.create_autoscaling_iam_role && length(merge(var.core_instance_fleet, var.master_instance_fleet)) == 0
  autoscaling_iam_role_name   = coalesce(var.autoscaling_iam_role_name, "${var.name}-autoscaling")
}
resource "aws_emr_cluster" "cluster" {
  name             = var.name
  release_label    = var.release_label
  log_uri          = aws_s3_bucket.emr_logs_bucket.bucket
  applications     = var.applications
  additional_info  = file(var.additional_info)
  autoscaling_role = local.create_autoscaling_iam_role ? aws_iam_role.autoscaling[0].arn : var.autoscaling_iam_role_arn



  termination_protection            = var.termination_protection
  keep_job_flow_alive_when_no_steps = var.keep_job_flow_alive_when_no_steps

  ec2_attributes {
    subnet_id                         = var.subnet_id
    key_name                          = var.key_name
    emr_managed_master_security_group = var.emr_managed_master_security_group
    emr_managed_slave_security_group  = var.emr_managed_slave_security_group
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn
  }

  master_instance_group {
    name          = var.master_instance_name
    instance_type = var.master_instance_type

    ebs_config {
      size                 = var.master_ebs_config_size
      type                 = var.master_ebs_config_type
      volumes_per_instance = var.master_ebs_config_volumes_per_instance
    }
  }

  core_instance_group {
    name           = var.core_instance_name
    instance_type  = var.slave_instance_type
    instance_count = var.slave_instance_count
    ebs_config {
      size                 = var.slave_ebs_config_size
      type                 = var.slave_ebs_config_type
      volumes_per_instance = var.slave_ebs_config_volumes_per_instance
    }




  }



  tags = {
    Name = var.emr_cluster_tagname
  }



  service_role = aws_iam_role.emr_role.name

}
# Define IAM role
resource "aws_iam_role" "autoscaling" {
  count                 = local.create_autoscaling_iam_role ? 1 : 0
  name                  = var.autoscaling_name
  name_prefix           = var.iam_role_use_name_prefix
  path                  = var.iam_role_path
  description           = coalesce(var.autoscaling_iam_role_description, "Autoscaling role for EMR cluster ${var.name}")
  assume_role_policy    = file(var.autoscaling_assume_role_policy)
  permissions_boundary  = var.iam_role_permissions_boundary
  force_detach_policies = true


}

resource "aws_iam_role" "ec2_instance" {
  name               = var.ec2_instance_role
  assume_role_policy = file(var.assume_role_policy_ec2)
}
# Define instance profile
resource "aws_iam_instance_profile" "emr_profile" {
  name = var.emr-instance-profile
  role = aws_iam_role.ec2_instance.name
}


#---------------------------------------------------
# IAM role for Amazon EMR
#---------------------------------------------------

resource "aws_iam_role" "emr_role" {
  name               = var.emr_role_name
  assume_role_policy = file(var.assume_role_policy)
}



resource "aws_iam_policy_attachment" "emr_policy_attachment" {
  name       = var.emr_policy_attachment
  roles      = [aws_iam_role.emr_role.name]
  policy_arn = var.policy_arn
}

resource "aws_iam_user_policy_attachment" "iam_user" {
  user       = var.iam_user_name
  policy_arn = var.policy_arn

}
#---------------------------------------------------
# Security group for Amazon EMR
#---------------------------------------------------


resource "aws_security_group" "emr_master_sg" {
  name        = var.emr_master_sg
  description = var.master_sg_description

  vpc_id = var.vpc_id

  // Define ingress rules for master node
  ingress {
    from_port   = var.ingress_from_port_master
    to_port     = var.ingress_to_port_master
    protocol    = var.protocol_master
    cidr_blocks = var.cidr_blocks_master
  }


}

resource "aws_security_group" "emr_slave_sg" {
  name        = var.emr_slave_sg
  description = var.slave_sg_description

  vpc_id = var.vpc_id

  // Define ingress rules for slave nodes
  ingress {
    from_port       = var.ingress_from_port_slave
    to_port         = var.ingress_to_port_slave
    protocol        = var.protocol_slave
    security_groups = [aws_security_group.emr_master_sg.id] # Allow inbound traffic from master
  }

  // Add more ingress rules as needed
}

#---------------------------------------------------
# S3 for Amazon EMR
#---------------------------------------------------

resource "aws_s3_bucket" "emr_logs_bucket" {
  bucket = var.bucket

}










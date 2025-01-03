## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_emr_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_cluster) | resource |
| [aws_iam_instance_profile.emr_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy_attachment.emr_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.emr_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_user_policy_attachment.iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.emr_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_security_group.emr_master_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.emr_slave_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | A list of applications bundle to be used in AWS EMR | `list(string)` | n/a | yes |
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | n/a | `any` | n/a | yes |
| <a name="input_assume_role_policy_ec2"></a> [assume\_role\_policy\_ec2](#input\_assume\_role\_policy\_ec2) | n/a | `any` | n/a | yes |
| <a name="input_autoscaling_policy"></a> [autoscaling\_policy](#input\_autoscaling\_policy) | n/a | `any` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the S3 bucket to store EMR logs and results | `any` | n/a | yes |
| <a name="input_cidr_blocks_master"></a> [cidr\_blocks\_master](#input\_cidr\_blocks\_master) | n/a | `any` | n/a | yes |
| <a name="input_core_instance_name"></a> [core\_instance\_name](#input\_core\_instance\_name) | n/a | `any` | n/a | yes |
| <a name="input_ec2_instance_role"></a> [ec2\_instance\_role](#input\_ec2\_instance\_role) | n/a | `any` | n/a | yes |
| <a name="input_emr-instance-profile"></a> [emr-instance-profile](#input\_emr-instance-profile) | n/a | `any` | n/a | yes |
| <a name="input_emr_cluster_tagname"></a> [emr\_cluster\_tagname](#input\_emr\_cluster\_tagname) | n/a | `any` | n/a | yes |
| <a name="input_emr_managed_master_security_group"></a> [emr\_managed\_master\_security\_group](#input\_emr\_managed\_master\_security\_group) | n/a | `any` | n/a | yes |
| <a name="input_emr_managed_slave_security_group"></a> [emr\_managed\_slave\_security\_group](#input\_emr\_managed\_slave\_security\_group) | n/a | `any` | n/a | yes |
| <a name="input_emr_master_sg"></a> [emr\_master\_sg](#input\_emr\_master\_sg) | n/a | `any` | n/a | yes |
| <a name="input_emr_policy_attachment"></a> [emr\_policy\_attachment](#input\_emr\_policy\_attachment) | n/a | `any` | n/a | yes |
| <a name="input_emr_role_name"></a> [emr\_role\_name](#input\_emr\_role\_name) | n/a | `any` | n/a | yes |
| <a name="input_emr_slave_sg"></a> [emr\_slave\_sg](#input\_emr\_slave\_sg) | n/a | `any` | n/a | yes |
| <a name="input_iam_user_name"></a> [iam\_user\_name](#input\_iam\_user\_name) | n/a | `any` | n/a | yes |
| <a name="input_ingress_from_port_master"></a> [ingress\_from\_port\_master](#input\_ingress\_from\_port\_master) | n/a | `any` | n/a | yes |
| <a name="input_ingress_from_port_slave"></a> [ingress\_from\_port\_slave](#input\_ingress\_from\_port\_slave) | n/a | `any` | n/a | yes |
| <a name="input_ingress_to_port_master"></a> [ingress\_to\_port\_master](#input\_ingress\_to\_port\_master) | n/a | `any` | n/a | yes |
| <a name="input_ingress_to_port_slave"></a> [ingress\_to\_port\_slave](#input\_ingress\_to\_port\_slave) | n/a | `any` | n/a | yes |
| <a name="input_keep_job_flow_alive_when_no_steps"></a> [keep\_job\_flow\_alive\_when\_no\_steps](#input\_keep\_job\_flow\_alive\_when\_no\_steps) |  | `any` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | key\_name the additional\_info of the EMR cluster | `any` | n/a | yes |
| <a name="input_master_ebs_config_size"></a> [master\_ebs\_config\_size](#input\_master\_ebs\_config\_size) | n/a | `any` | n/a | yes |
| <a name="input_master_ebs_config_type"></a> [master\_ebs\_config\_type](#input\_master\_ebs\_config\_type) | n/a | `any` | n/a | yes |
| <a name="input_master_ebs_config_volumes_per_instance"></a> [master\_ebs\_config\_volumes\_per\_instance](#input\_master\_ebs\_config\_volumes\_per\_instance) | n/a | `any` | n/a | yes |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | n/a | `any` | n/a | yes |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_master_sg_description"></a> [master\_sg\_description](#input\_master\_sg\_description) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the EMR cluster | `any` | n/a | yes |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | n/a | `string` | `"arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"` | no |
| <a name="input_protocol_master"></a> [protocol\_master](#input\_protocol\_master) | n/a | `any` | n/a | yes |
| <a name="input_protocol_slave"></a> [protocol\_slave](#input\_protocol\_slave) | n/a | `any` | n/a | yes |
| <a name="input_release_label"></a> [release\_label](#input\_release\_label) | The release\_label of the EMR cluster | `any` | n/a | yes |
| <a name="input_slave_ebs_config_size"></a> [slave\_ebs\_config\_size](#input\_slave\_ebs\_config\_size) | n/a | `any` | n/a | yes |
| <a name="input_slave_ebs_config_type"></a> [slave\_ebs\_config\_type](#input\_slave\_ebs\_config\_type) | n/a | `any` | n/a | yes |
| <a name="input_slave_ebs_config_volumes_per_instance"></a> [slave\_ebs\_config\_volumes\_per\_instance](#input\_slave\_ebs\_config\_volumes\_per\_instance) | n/a | `any` | n/a | yes |
| <a name="input_slave_instance_count"></a> [slave\_instance\_count](#input\_slave\_instance\_count) | n/a | `any` | n/a | yes |
| <a name="input_slave_instance_type"></a> [slave\_instance\_type](#input\_slave\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_slave_sg_description"></a> [slave\_sg\_description](#input\_slave\_sg\_description) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet\_id of the EMR cluster | `any` | n/a | yes |
| <a name="input_termination_protection"></a> [termination\_protection](#input\_termination\_protection) | termination\_protection for EMR cluster | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where the EMR cluster will be launched | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_applications"></a> [applications](#output\_applications) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_release_label"></a> [release\_label](#output\_release\_label) | n/a |

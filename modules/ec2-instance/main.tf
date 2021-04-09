
resource "aws_instance" "ec2" {
#count = var.ebs_volume_size == 0 ? 0:1
ami= var.ami
ebs_optimized=var.ebs_optimized
instance_type= var.instance_type
monitoring=var.monitoring
iam_instance_profile=var.iam_instance_profile
tags=var.tags
volume_tags=var.volume_tags
disable_api_terminsation=var.disable_api_terminsation
network_interface {
  network_interface_id=var.network_interface_id
  device_index=0
}

/*root_block_device{
  volume_type=var.root_volume_type
  volume_size=var.root_volume_size
  delete_on_termination=var.root_delete_on_termination
  encrypted=var.root_encrypted
  #kms_key_id=var.root_kms_key_id

  #iops =var.root_iops
}

ebs_block_device{
  device_name=var.ebs_device_name
  volume_type=var.ebs_volume_type
  volume_size=var.ebs_volume_size
  delete_on_termination=var.ebs_delete_on_termination
  encrypted=var.encrypted
  //kms_key_id=var.kms_key_id

}*/
}


#vpc_security_group_ids=var.vpc_security_group_ids
#subnet_id=var.subnet_id
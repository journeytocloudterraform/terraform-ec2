variable "ami" {
    type="string"
    description="(Required)The AMI touse for the instance"
}

variable "availability_zone" {
    default = ""
    description = "Optional) AZ to start the instance in."
}
variable "placement_group" {
    default = ""
    description = "(Optional) Placement Group to start the instance in."
}
variable "tenancy" {
    default = ""
    description = " (Optional) Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command."
}
variable "host_id" {
    default = ""
    description = "(Optional) ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host."
}
variable "cpu_core_count" {
    default = ""
    description = "(Optional) Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API."
}
variable "cpu_threads_per_core" {
    default = ""
    description = "(Optional - has no effect unless"
  
}
variable "env" {
    default = ""
  
}
variable "owner" {
    default = "msriramu"
  
}
variable "dataclass" {
    default = ""
  
}
variable "subnet_name" {
    default = ""
  
}

variable "ebs_optimized" {
    description = " (Optional) If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information."
      
}
variable "disable_api_termination" {
  default=""
  description="(Optional) If true, enables EC2 Instance Termination Protection."
}
variable "instance_initiated_shutown_behavior" {
    default = ""
    description = "(Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information."
}
variable "instance_type" {
    type="string"
    description="(Required) Type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."

}
variable "key_name" {
    description = "Optional) Key name of the Key Pair to use for the instance; which can be managed using the"
      
}
variable "get_password_data" {
    default = ""
    description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information."

}
variable "monitoring" {
    default = "false"
    description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)"
  
}
variable "vpc_security_group_ids" {
        default = []
        type = list
        description = "(Optional, VPC only) A list of security group IDs to associate with."
}
variable "subnet_id" {
    default = ""
    description = "(Optional) VPC Subnet ID to launch in."
  
}
variable "associate_public_ip_address" {
    default = ""
    description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
}
variable "private_ip" {
    default = ""
    description = "(Optional) Private IP address to associate with the instance in a VPC."

}
variable "source_dest_check" {
    default = ""
    description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
  
}
variable "user_data" {
    description = "(Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  
}
variable "user_data_base64" {
    default = ""
    description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  
}
variable "iam_instance_profile" {
    description = "(Optional) IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole."
  
}
variable "ipv6_address_count" {
    default = ""
    description = "(Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
  
}
variable "ipv6_address" {
    description = "(Optional) Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
    default = ""
  
}
variable "tags" {
    default = {}
    type = "map"
    description = " (Optional) A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices."
  
}
variable "volume_tags" {
    default = {}
    type = "map"
    description = "(Optional) A map of tags to assign, at instance-creation time, to root and EBS volumes."
}
variable "root_volume_types" {
    default = ""
    description = "value"
  
}
variable "root_volume_size" {
    description = "(Optional)The size of thevolume in gigabytes(GiB)"
  
}
variable "root_iops" {
    default = ""
    description = "(Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3."

  
}
variable "root_delete_on_termination" {
    default = "true"
    description = "(Optional) Whether the volume should be destroyed on instance termination. Defaults to true."
  
}
variable "root_encrypted" {
    description = "(Optional) Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection."
}
variable "root_kms_key_id" {
    description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection."

  
}

variable "ebs_device_name" {
    description = "The name of the block device to mount on the instance."
    default = "/dev/sda2"
}

variable "ebs_snapshot_id" {
    default = ""
    description = " (Optional) Snapshot ID to mount."
  
}
variable "ebs_volume_type" {
    default = "gp2"
    description = "(Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2."
  
}
variable "ebs_volume_size" {
    description = "(Optional) Size of the volume in gibibytes (GiB)."
  
}
variable "ebs_iops" {
    default = ""
    description = "(Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3."
  
}
variable "ebs_delete_on_termination" {
    default = "true"
    description = " (Optional) Whether the volume should be destroyed on instance termination. Defaults to true."
  
}
variable "ebs_encrypted" {
    description = "(Optional) Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection."
  
}

variable "ebs_kms_key_id" {
    description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection."
  
}

variable "network_interface_id" {
    default = ""
    description = "(Required) ID of the network interface to attach."
  
}

variable "kms_key_name" {
    default = "MyKMSForCustomAMI"
    description = "(Required)aliasof theKMS key for encryption ebs and root volume"
  
}

variable "ec2_names" {
    description = "Name to be used for ec2 instance"
    type = "list"
  
}






























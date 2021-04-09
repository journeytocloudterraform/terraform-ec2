variable "name" {
  description = "My EC2 instance"
  default="myfirstistace"
}

variable "instance_type" {
  description = "Istacetype"
  default     = "t2.micro"
}
variable "ami" {
    
    default="ami-03d64741867e7bb94"
}
variable "env" {
  type = "string"
  default = "dev"
  
}
variable "AWS_ACCESS_KEY" {
  default = "AKIA3O3DPU5MBT5HL4LW"
  
}
variable "AWS_SECRET_KEY" {
  default="4uXSe6ORvdD6oTIW9EDhsVGC8NKm7bG8Tmk7UFoe"
  
}
variable "owner" {
  type = "string"
  default = "sriram"
  
}
variable "ebs_optimized" {
  default="false"
}
variable "root_volume_size" {
  type = "string"
  default = "10"

  
}
variable "root_volume_type" {
  type = "string"
  default = "gp2"

  
}

variable "availability_zone" {
    default = "us-east-2a"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "enable_dns_support" {
    default = "true"
    description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  
}

variable "subnetCIDRblock" {
    default = "10.0.1.0/24"
}

variable "ebs_volume_type" {
  default = "gp2"
  type = "string"
  
}
variable "ebs_volume_size" {
  default = "0"
  type = "string"
  
}
variable "subnet_name" {
  default = "app-ec2-1"
  
}
variable "dataclass" {
  default = "internal"
  
}
variable "disable_api_terminsation" {
  default = "true"
  
}


provider "aws" {
  region     = "us-east-2"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  
}

data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    bucket = "store-terraform-state-poc"
    key    = "dev/myapp/terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_iam_role_policy" "ec2policy" {
  name = "ec2policy"
  role = aws_iam_role.ec2_role.id
  policy = "${file("ec2-policy.json")}"

}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = "${file("ec2-assume-policy.json")}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role .name
}


resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"  

      tags = {
    Name = "my-vpc"
  } 

}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"
      tags = {
    Name = "my-subnet"
  }
    
}

resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.prod-vpc.id
    
}

resource "aws_route_table" "prod-public-crt" {
    vpc_id = aws_vpc.prod-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.prod-igw.id
    }
    
  
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = aws_subnet.prod-subnet-public-1.id
    route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = aws_vpc.prod-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
    }
       ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

 
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web1.id
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a"
  size              = 1
}
resource "aws_instance" "web1" {
  //source="../modules/ec2-instance"

  ami = var.ami
  instance_type=var.instance_type
  subnet_id=aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  iam_instance_profile=aws_iam_instance_profile.ec2_profile.name
    tags = {
    Name = "MyFirstEC2"
  }
  }

  
/*
module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = var.aws_vpc_cidr_block
  enable_dns_support=""
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink = "false"
  instance_tenancy = "default"
  vpc_id = aws_vpc.prod-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone = "us-east-2a"
  

  
}
*/

/*module "myec2-instance" {
  source="../modules/ec2-instance"
  ami = var.ami
  ec2_names="testig"
  instance_type=var.instance_type
  iam_instance_profile = var.iam_instance_profile
  ebs_volume_size=var.ebs_volume_size
  ebs_volume_type=var.ebs_volume_type
  ebs_optimized=var.ebs_optimized
  root_volume_type=var.root_volume_type
  root_volume_size=var.root_volume_size
  env=var.env
  owner=var.owner
  dataclass=var.dataclass
  disable_api_termination=var.disable_api_termination
  subnet_name=var.subnet_name
  subnet_id=aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
    
}
*/

/*module "my_vpc" {
  source = "../modules/vpc"
  cidr_block = var.cidr_block
  enable_dns_support=var.enable_dns_support
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink = "false"
  instance_tenancy = "default"

  
}

module "my_subnet" {
  source = "../modules/subnet"
  vpc_id = module.my_vpc.id
  cidr_block = var.subnetCIDRblock
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone = var.availability_zone
  

  
}*/
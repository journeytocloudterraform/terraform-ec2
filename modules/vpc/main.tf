resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = var.enable_dns_support #gives you an internal domain name
    enable_dns_hostnames = var.enable_dns_hostnames #gives you an internal host name
    enable_classiclink = var.enable_classiclink
    instance_tenancy = var.instance_tenancy
    
    tags {
        Name = var.vpcname
    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = var.vpc_id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    #availability_zone = "us-east-2a"
    tags {
        Name = var.subnetname
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags {
        Name = "igw"
    }
}

resource "aws_route_table" "prod-public-crt" {
    vpc_id = aws_vpc.main-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags {
        Name = "public-crt"
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
        cidr_blocks = var.egressCIDRblock
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = "ingressCIDRblock"
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = "ingressCIDRblock"
    }
    tags {
        Name = "ssh-allowed"
    }
}
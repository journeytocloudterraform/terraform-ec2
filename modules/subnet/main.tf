resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr_block
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags {
        Name = var.subnetname
    }
}
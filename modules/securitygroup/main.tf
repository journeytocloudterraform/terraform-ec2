data "aws_caller_identity"{}

resource "aws_security_group" "security_group"{
    count = var.count
    name=var.name
    description="Create a VPC"
    vpc_id=var.vpc_id
    tags=var.tags

}
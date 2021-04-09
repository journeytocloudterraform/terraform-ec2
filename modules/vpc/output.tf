output "id" {
    value = aws_vpc.vpc.id
  
}

output "mysubnetID" {
    value = aws_subnet.prod-subnet-public-1.id
  
}

output "route_table_id" {
    value=aws_route_table.prod-public-crt.id
  
}
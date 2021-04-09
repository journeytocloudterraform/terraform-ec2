variable "region"{
    default="us-east-1"
}
variable "name" {
    type ="list"
    default = ["ingress_group", "egress_group"]
  
}

variable "description"{
    type = "map"
    default = {
        "ingress_group"=["default ingress group"]
        "egress-group"=["default egress group"]
    }
}

variable "vpc_id" {
    description = "vpc id (arn) of the VPC used"

  
}

variable "tags"{

    type = "map"
    description = "tagson the resources"
    default = {
        "system_number"="00000"
    }
}
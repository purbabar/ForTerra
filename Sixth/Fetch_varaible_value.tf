provider "aws"{
    region = "ap-south-1"
}

resource "aws_instance" "web1" {
    ami = "ami-02a2af70a66af6dfb"
    instance_type = var.ec2_type_map["us-east-1"]
}

variable "ec2_type_list" {
  type = list
  default = ["t2.micro","t2.small","t2.large"]
}

variable "ec2_type_map" {
  type = map
  default = {
    ap-south-1 = "t2.micro"
    us-east-1 = "t2.large"
  }
}
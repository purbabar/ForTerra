provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web1" {
    ami = "ami-02a2af70a66af6dfb"
    instance_type = var.instancetype
  
}
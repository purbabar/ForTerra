provider "aws" {
  region = "ap-south-1"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "tags" {
  type    = list(any)
  default = ["ec2-first", "ec2-second"]
}

variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  type = map(any)
  default = {
    ap-south-1 = "ami-02a2af70a66af6dfb"
    us-east-1  = "ami-02a2af70a66af6dff"
    us-west-1  = "ami-02a2af70a66af6dfd"
  }
}

resource "aws_key_pair" "login" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.login.key_name
  count         = 2
  tags = {
    Name = element(var.tags, count.index)
  }
}

output "currentime" {
  value = local.time
}
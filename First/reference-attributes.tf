provider "aws" {
  region = "ap-south-1"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

resource "aws_eip" "lb2" {
  domain = "vpc"
}

output "public_ip" {
  value = aws_eip.lb.public_ip
}

output "public_ip2" {
  value = aws_eip.lb2.public_ip
}

resource "aws_security_group" "mynewTLS" {
  name = "mynewTLSgroup"
  description = "mynewTLSgroup"

  ingress {

    description = "allow ssh from specific ips"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

  egress {
    from_port = 0
    to_port =  0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "allow ssh"
  }
}
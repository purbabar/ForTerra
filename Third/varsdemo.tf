provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "mynew" {
  name = "toOpenSSH"
  description = "toOpenSSH"
  ingress{
    description = "to open ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}

output "var_value" {
  value = var.vpn_ip
}
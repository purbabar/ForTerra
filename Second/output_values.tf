provider "aws" {
  region = "ap-south-1"
}

resource "aws_eip" "lb1" {
  domain = "vpc"
}

output "my_first_public" {
  value = aws_eip.lb1.public_ip
}

output "with_url" {
  value = "https://${aws_eip.lb1.public_ip}"
}
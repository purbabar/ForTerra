provider "aws" {
  region = "ap-south-1"
}

variable "is-test" {
}

resource "aws_instance" "dev" {
  ami = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"
  count = var.is-test == true ? 1 : 0
}

resource "aws_instance" "prod" {
  ami = "ami-02a2af70a66af6dfb"
  instance_type = "t2.small"
  count = var.is-test == false ? 1 : 0
}
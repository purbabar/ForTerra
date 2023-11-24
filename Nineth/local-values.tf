provider "aws" {
  region     = "ap-southeast-1"
}

locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}

locals {
  new_tags = {
    owner = "linux team"
    service = "prod"
  }
}


resource "aws_instance" "app-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_instance" "db-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.small"
   tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags = local.new_tags
}
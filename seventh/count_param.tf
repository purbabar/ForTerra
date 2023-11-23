provider "aws" {
    region = "ap-south-1"
}

variable "new" {
  type = list
  default = ["prod","lab","test"]
}

resource "aws_iam_user" "lb" {
  name = var.new[count.index]
  count = 3
}


resource "aws_iam_user" "first" {
  name = "labuser"
}
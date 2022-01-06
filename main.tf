terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
 tags = {
    Name = "my-first-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
}

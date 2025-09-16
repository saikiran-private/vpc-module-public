provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "tier-3-vpc" {
  cidr_block = var.vpc_cidr

    tags = {
    Name = "3-tier-vpc"
  }
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  
}

resource "aws_subnet" "Public-Web-Subnet" {
  vpc_id     = aws_vpc.tier-3-vpc.id
  cidr_block = var.subnet-cidr
  tags = {
    Name = "Public-Web-Subnet"
  }
}


variable "subnet-cidr" {
  default = "10.0.0.0/24"
  
}

output "subnet-id" {
  value = aws_subnet.Public-Web-Subnet.id
}

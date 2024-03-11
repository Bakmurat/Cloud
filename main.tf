terraform { 
  cloud { 
    organization = "bakmurat0823" 
    workspaces { 
      name = "example-workspace" 
    } 
  } 
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"

  tags = {
    Name = "example_instance"
  }
}


output "ec2-public" {
  value = aws_instance.example.public_ip
}
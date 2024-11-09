provider "aws" {
  region = "eu-west-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-09b0a86a2c84101e1"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"      # Choose your instance type

  tags = {
    Name = "ExampleInstance"
  }
}


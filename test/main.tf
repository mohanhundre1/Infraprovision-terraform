provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0866a3c8686eaeeba"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"      # Choose your instance type

  tags = {
    Name = "ExampleInstance"
  }
}


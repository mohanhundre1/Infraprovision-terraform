terraform {
  backend "s3" {
    bucket = "mohanhundre-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "ec2_instance" {
  source         = "../../modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  instance_name  = var.instance_name
}

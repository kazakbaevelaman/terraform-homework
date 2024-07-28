terraform {
  backend "s3" {
    bucket = "s3-bucket-kaizen"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-lock-state"
  }
}


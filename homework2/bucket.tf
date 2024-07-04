# create bucket 
resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-elaman"
}

resource "aws_s3_bucket" "bucket2" {
  bucket_prefix = "kaizen-"
}

# import bucket from aws
# terraform import aws_s3_bucket.bucket3 kaizen-test-b1
# terraform import aws_s3_bucket.bucket4 kaizen-test-b2

resource "aws_s3_bucket" "bucket3" {
  bucket = "kaizen-test-b1"
}

resource "aws_s3_bucket" "bucket4" {
  bucket = "kaizen-test-b2"
}
resource "aws_s3_bucket" "tf_state" {
  bucket        = "${var.bucket_name}"
  force_destroy = false

  tags = {
    Name        = "${var.project_name}-tf-state"
    Description = "S3 bucket for Terraform state storage"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "${var.project_name}-tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.project_name}-tf-locks"
    Description = "DynamoDB table for Terraform state locking"
  }
}

terraform {
  backend "s3" {
    bucket         = "jnf-terraform-state"   # S3 bucket name
    key            = "env/techology-notes/terraform/kata/terraform.tfstate"  # Path inside the bucket
    region         = "us-west-2"                   # Bucket region
    encrypt        = true                          # Encrypt the state file at rest
    # dynamodb_table = "terraform-locks"             # Optional: for state locking
  }
}

# provider "terraform-aws-modules" {
# }
module "vpc" {
  count = 1
  source  = "terraform-aws-modules/vpc/aws"
#   version = "5.1.2" # pick a stable version

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  # This ensures an Internet Gateway is created and public subnets route to it
  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "vpc_id" {
  value = module.vpc[*].vpc_id
}

output "private_subnets" {
  value = module.vpc[*].private_subnets
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "altana-cluster"
  cluster_version = "1.21"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id = module.vpc.vpc_id
  #count         = length(var.private_subnet)
  subnet_ids    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  #depends_on = [aws_subnet.altana-subnet1]
  
}
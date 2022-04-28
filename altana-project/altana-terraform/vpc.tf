module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "altana-vpc1"
  cidr = "10.0.0.0/16"

  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  enable_dns_support   = true
  enable_dns_hostnames = true

}

resource "aws_internet_gateway" "altana-gw" {
  vpc_id = module.vpc.vpc_id
}

resource "aws_subnet" "altana-subnet1" {
  vpc_id     = module.vpc.vpc_id
  count      = length(var.private_subnet)
  cidr_block = element(var.private_subnet, count.index)

}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.altana-gw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  count         = length(aws_subnet.altana-subnet1)
  subnet_id     = element(aws_subnet.altana-subnet1.*.id, 0)

}
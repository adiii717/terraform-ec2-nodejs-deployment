# Creating VPC
resource "aws_vpc" "VPC" {
  cidr_block           = "${var.aws_ip_cidr_range}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.env_prefix_name}-VPC"
  }
}


# Creating Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.VPC.id}"
  tags = {
    Name = "${var.env_prefix_name}-Internet Gateway"
  }
}

# Creating Subnets public

# Public Subnets
resource "aws_subnet" "PubSubnet2a" {
  cidr_block        = "${cidrsubnet(aws_vpc.VPC.cidr_block, 8, 8)}" # creating 10.0.8.0/24 subnet
  vpc_id            = "${aws_vpc.VPC.id}"
  availability_zone = "${var.availibility_zones["zone4"]}"
  tags = {
    Name = "${var.env_prefix_name}-Public Subnet 2a"
  }
}


# Creating Public Routing Table with Internet Gateway
resource "aws_route_table" "RTPublic" {
  vpc_id = "${aws_vpc.VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }

  tags = {
    Name = "${var.env_prefix_name}-Public Routing Table"
  }
}


resource "aws_route_table_association" "PubRTAssoc2a" {
  subnet_id      = "${aws_subnet.PubSubnet2a.id}"
  route_table_id = "${aws_route_table.RTPublic.id}"
}

data "aws_route53_zone" "primary" {
  name = "goabode.co."
}

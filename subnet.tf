provider "aws" {
  region = "us-east-1"
}

#Vpc
resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_terraform"
  }
}

#Public_Subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}


resource "aws_egress_only_internet_gateway" "example" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "main"
  }
}

#Internet_gatway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "internet_gatwayPub"
  }
}

# Route_table
resource "aws_route_table" "example" {
   vpc_id = aws_vpc.test_vpc.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
      # workaround as suggested here: https://issueexplorer.com/issue/hashicorp/terraform-provider-aws/20756#issuecomment-913284042
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  ]

  tags = {
    Name = "Test_route"
  }
}
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.test_vpc.id
  route_table_id = aws_route_table.example.id
}
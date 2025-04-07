resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {

    Name = "${local.env}_nat_eip"

  }

}

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_zone1.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${local.env}_nat_gateway"
  }

}
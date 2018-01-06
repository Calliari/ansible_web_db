/* EXTERNAL NETWORKING, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.account_name} internet gateway"
    Account = "${var.account_name}"
  }
}

resource "aws_network_acl" "all" {
  vpc_id = "${aws_vpc.vpc.id}"
  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  ingress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  tags {
    Name = "${var.account_name} ACL"
    Account = "${var.account_name}"
  }
}

# Public
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.account_name} Public"
    Account = "${var.account_name}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

# Private
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.account_name} Private"
    Account = "${var.account_name}"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
    # nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  }
}

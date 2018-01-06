# security group for the webserver on dev/demo server public subnet
resource "aws_security_group" "websg" {
  name = "security_group_for_webserver_stage_dev"
  vpc_id = "${aws_vpc.vpc.id}"
  description = "Security Group for ${var.account_name} "
# port for APIs to connect with vault
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8983
    to_port = 8983
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Port for ansible conf managemnt and ssh users
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    # cidr_blocks = ["${var.Subnet-Public-AzA-CIDR}"]
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Account = "${var.account_name}"
  }
}

# security group for the percona database private subnet
resource "aws_security_group" "dbsg" {
  name = "security_group_for_percona_db"
  description = "${var.account_name} Percona installed on a EC2"
  vpc_id = "${aws_vpc.vpc.id}"

  # Only mysql and ssh in
  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "TCP"
  #   cidr_blocks = ["${var.Subnet-Public-AzA-CIDR}"]
  # }
  # DANGER accepts connections from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # mysql open port to demo webserver
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.Subnet-Public-AzA-CIDR}"]
    # cidr_blocks = ["0.0.0.0/0"]
  }
  # mysql open port to dev webserver
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.Subnet-Private-AzA-CIDR}"]
    # cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic from database.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

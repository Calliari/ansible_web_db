# this is running on public subnet
resource "aws_instance" "web-stage" {
  ami           = "${var.ami_webserver}"
  count = "${var.number_of_aws_instance_to_launch}"
  # count = "0"
  instance_type = "${var.web_instance_type}"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.websg.id}"]
  key_name ="${var.key_name}"
  user_data ="${file("scripts/python-install.sh")}"
  # iam_instance_profile = "${aws_iam_instance_profile.ansible_role.name}"

  # EC2 Block Storage initial capacity ">=8GB is minimum"
    root_block_device = {
      volume_type = "gp2"
      volume_size = "30"
      delete_on_termination = "true"
    }

    ebs_block_device = {
    device_name       = "/dev/xvdf"
    volume_size       = "30"
    volume_type       = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name = "${var.aws_instance} website for STAGE"
    Account = "${var.account_name}"
  }

    lifecycle {
    create_before_destroy = true
  }
}

# this is running on private subnet
resource "aws_instance" "web-dev" {
  ami           = "${var.ami_webserver}"
  # count = "${var.number_of_aws_instance_to_launch}"
  count = "0"
  instance_type = "${var.web_instance_type}"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.websg.id}"]
  key_name ="${var.key_name}"
  user_data ="${file("scripts/python-install.sh")}"

  # EC2 Block Storage initial capacity ">=8GB is minimum"
    root_block_device = {
      volume_type = "gp2"
      volume_size = "30"
      delete_on_termination = "false"
    }

    ebs_block_device = {
    device_name       = "/dev/xvdf"
    volume_size       = "30"
    volume_type       = "gp2"
    # delete_on_termination = "false"
  }


  tags {
    Name = "${var.aws_instance} website for DEV"
    Account = "${var.account_name}"
  }

    lifecycle {
    create_before_destroy = true
  }
}

# this is running on private subnet
resource "aws_instance" "mysql" {
  ami           = "${var.ami_mysql}"
  count = "${var.number_of_aws_instance_to_launch}"
  # count = "0"
  instance_type = "${var.db_instance_type}"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.dbsg.id}"]
  key_name = "${var.key_name}"
  user_data ="${file("scripts/python-install.sh")}"
  # iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.name}"

# EC2 Block Storage initial capacity ">=8GB is minimum"
  root_block_device = {
    volume_type = "gp2"
    volume_size = "100"
    delete_on_termination = "true"
  }
#
#   ebs_block_device = {
#   device_name       = "/dev/xvdf"
#   volume_size       = "50"
#   volume_type       = "gp2"
#   # delete_on_termination = "false"
# }


  tags {
    Name = "${var.aws_instance} percona mysql for DEV/STAGE"
    Account = "${var.account_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

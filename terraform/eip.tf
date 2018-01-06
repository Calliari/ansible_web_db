# allocate an Elastic ip address to NAT Gateway instance
# resource "aws_eip" "forNat" {
#   vpc      = true
# }

# Elastic public IP address "EIP" associated with database (percona) EC2 instance
resource "aws_eip" "ec2-mysql" {
  instance = "${aws_instance.mysql.id}"
  vpc      = true
}

# Elastic public IP address "EIP" associated with dev EC2 instance
# resource "aws_eip" "ec2-dev" {
#   instance = "${aws_instance.web-dev.id}"
#   vpc      = true
# }

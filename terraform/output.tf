output "region" {
  value = "${var.region}"
}

output "account" {
  value = "${var.account_name}"
}

# output "EIP-address-when-EIP-associated" {
#   value = "${aws_eip.ec2.public_ip}"
# }
output "DEMO_EC2-public_ip" {
  value = "${aws_instance.web-stage.*.public_ip}"
}
# output "DEV_EC2-public_ip" {
#   value = "${aws_eip.ec2-dev.public_ip}"
# }
output "PERCONA_EC2-public_ip" {
  value = "${aws_eip.ec2-mysql.public_ip}"
}
output "PERCONA_EC2-private_ip" {
  value = "${aws_instance.mysql.*.private_ip}"
}

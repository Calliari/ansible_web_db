# # Allow private subnet access the internet
# resource "aws_nat_gateway" "PublicAZA" {
#   allocation_id = "${aws_eip.forNat.id}"
#   subnet_id = "${aws_subnet.PublicAZA.id}"
#   depends_on = ["aws_internet_gateway.gw"]
# }

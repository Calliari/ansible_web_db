# # create a policy for ansible role
# resource "aws_iam_policy" "policy" {
#   name        = "ec2-policy-ansible-role"
#   description = "This policy controls permission for services that an ec2 server role running ansible software needs to provision another ec2 instances in the private subnet"
#   policy      = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "NotAction": [
#                 "iam:*",
#                 "organizations:*"
#             ],
#             "Resource": "*"
#         },
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "iam:CreateServiceLinkedRole",
#                 "iam:DeleteServiceLinkedRole",
#                 "iam:ListRoles",
#                 "organizations:DescribeOrganization"
#             ],
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }
#
#
# # This is the powerUserAccess *TOO MUCH POWER* need to be worked out
# # {
# #     "Version": "2012-10-17",
# #     "Statement": [
# #         {
# #             "Effect": "Allow",
# #             "NotAction": [
# #                 "iam:*",
# #                 "organizations:*"
# #             ],
# #             "Resource": "*"
# #         },
# #         {
# #             "Effect": "Allow",
# #             "Action": [
# #                 "iam:CreateServiceLinkedRole",
# #                 "iam:DeleteServiceLinkedRole",
# #                 "iam:ListRoles",
# #                 "organizations:DescribeOrganization"
# #             ],
# #             "Resource": "*"
# #         }
# #     ]
# # }
#
#
# # iam role - this role will be in charge of provision the ce2 in the private subnet
# resource "aws_iam_role" "ansible_role" {
#   name = "ansible_role"
#   path = "/"
#   description = "This policy controls permission for services that an ec2 server role running ansible software to provision another ec2 instances in the private subnet"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }
#
#
# # attach the policy to a ansible role
# resource "aws_iam_policy_attachment" "ansible-attach" {
#     name       = "ansible-attachment"
#     roles      = ["${aws_iam_role.ansible_role.name}"]
#     policy_arn = "${aws_iam_policy.policy.arn}"
#   }
#
#
# # not sure why I need this, this add the "Instance Profile ARNs", and let me choose the ansible role when an ec2 is created., without the this code it can't assign anisble_role to an ec2 instance
# resource "aws_iam_instance_profile" "ansible_role" {
#   name = "ansible_role"
#   role = "${aws_iam_role.ansible_role.name}"
# }

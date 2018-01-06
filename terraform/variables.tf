variable "region" {
  default = "eu-west-2"
}
variable "aws_access_key" {
  description = "the user aws access key"
  # default should be in terraform.tfvars
}
variable "aws_secret_key" {
  description = "the user aws secret key"
  # default should be in terraform.tfvars
}

variable "account_name" {
  default = "TEST-ENV"
  description = "the account name, matches to resource group"
}
# Key Pair
variable "key_name" {
  # default = "ec2_PemKey-bbd"
  description = "the ssh key to use in the EC2 machines"
}


# VPC settings
variable "vpc-fullcidr" {
  # 172.28.0.0 - 172.28.255.255
  default = "172.28.0.0/16"
  description = "the vpc cdir"
}
# VPC public subnet
variable "Subnet-Public-AzA-CIDR" {
  # 172.28.1.0 - 172.28.1.255
  default = "172.28.1.0/24"
  description = "the cidr of the public subnet"
}
# VPC private subnet
variable "Subnet-Private-AzA-CIDR" {
  # 172.28.2.0 - 172.28.2.255
  default = "172.28.2.0/24"
  description = "the cidr of the subnet"
}

# EC2 AMI
# instance name
variable "aws_instance" {
  default = "Server"
}

# AMI flavour (Red Hat, Ubuntu, Amazon) for webserver
variable "ami_webserver" {
  default = "ami-996372fd"
  description = "EC2 instace where the DEMO are running"
}
variable "web_instance_type" {
  default = "t2.micro"
}


# AMI flavour (Red Hat, Ubuntu, Amazon) for percona mysql database
variable "ami_mysql" {
  default = "ami-996372fd"
  description = "EC2 instace where percone mysql is installed and running"
}
variable "db_instance_type" {
  default = "t2.micro"
}

# how many instance to launch
variable "number_of_aws_instance_to_launch" {
  default = "1"
}

# S3 BUCKETS dev
variable "dev_s3_bucket" {
  default = "dev-drupal-file"
}
# S3 BUCKETS demo
variable "demo_s3_bucket" {
  default = "demo-drupal-file"
}

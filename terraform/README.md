### Terraform-scripts
Terraform provisioning for this environment

install terraform, open terminal on MAC

```
brew install terraform

```

Local instructions:

Create the terraform.tfvars, and add the AWS account details for "access_key" and "secret_key":
aws_access_key = "foo"
aws_secret_key = "bar"
where access_key and secret_key are your AWS keys. Note: the keys must have access for VPC, SG, EC2, Subnet, EIP.

Download/install terraform locally.

Run:

terraform init
terraform plan
terraform apply
To destroy the environment, run:

terraform destroy
Output the public_ip address for the EC2
There are two ip address display after the after the completion of the infrastructure, Terraform will display the elastic public ip address (EIP) after the completion of the infrastructure and the ec2 public_ip in case EIP is not associated to the ec2.
infrastructure
This will create a one VPC

Security group (websg)

open port in the SG 80 for web access
open port in the SG 22 for ssh access
open port in the SG 8080 for web access
open port in the SG 8983 for apache solr
Routing and network - Access Control Lists ( ACL default )


Security group (dbsg)


open port in the SG 22 for ssh access
open port in the SG 8080 for web access
open port in the SG 3306 for Allow connections from stage and dev instances 
Routing and network - Access Control Lists ( ACL default )

EC2 (ubuntu 16.06 AMI with python installed)

The env will contain;
* ec2 in the private subnet with elastic ip address
* ec2 on the public subnet
* security group
* configuration for routing and network

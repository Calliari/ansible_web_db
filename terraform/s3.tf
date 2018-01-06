# S3 bucket - storing file for dev "/data/drupal_file"
# resource "aws_s3_bucket" "drupal_data_dev_bucket" {
#   bucket = "${lower(var.demo_s3_bucket)}"
#
#     tags {
#     Name        = "Bucket /data/drupal_file"
#     Environment = "STAGE"
#   }
# }

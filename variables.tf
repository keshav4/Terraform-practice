variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

# variable "aws_access_key" {
#   description = "The AWS access key"
#   type        = string
#   sensitive   = true
# }

# variable "aws_secret_key" {
#   description = "The AWS secret key"
#   type        = string
#   sensitive   = true
# }

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "ec2_instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
}
variable "ec2_instance_name1" {
  description = "The name tag for the EC2 instance1"
  type        = string
}
variable "ec2_instance_name2" {
  description = "The name tag for the EC2 instance2"
  type        = string
}
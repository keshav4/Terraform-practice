provider "aws" {
  region     = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

// Created policy
resource "aws_iam_policy" "ec2_policy" {
  name        = "Practice"
  description = "Policy granting EC2 access"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "ec2:DescribeInstances"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:StartInstances"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:StopInstances"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

// Created role
resource "aws_iam_role" "ec2_role" {
  name               = "EC2Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

// Attached policy to role
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  policy_arn = aws_iam_policy.ec2_policy.arn
  role       = aws_iam_role.ec2_role.name
}

// Create an IAM instance profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

// Launch EC2 instance
resource "aws_instance" "example" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = var.ec2_instance_name
  }
}
resource "aws_instance" "example1" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = var.ec2_instance_name1
  }
}
resource "aws_instance" "example2" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = var.ec2_instance_name2
  }
}

output "example_instance_id" {
  description = "The ID of the first EC2 instance"
  value       = aws_instance.example.id
}

output "example_instance_public_ip" {
  description = "The public IP of the first EC2 instance"
  value       = aws_instance.example.public_ip
}
output "example_instance_public_ip1" {
  description = "The public IP of the first EC2 instance"
  value       = aws_instance.example1.public_ip
}
output "example1_instance_id" {
  description = "The ID of the second EC2 instance"
  value       = aws_instance.example1.id
}
output "example_instance_public_ip2" {
  description = "The public IP of the first EC2 instance"
  value       = aws_instance.example2.public_ip
}
output "example2_instance_id" {
  description = "The ID of the third EC2 instance"
  value       = aws_instance.example2.id
}


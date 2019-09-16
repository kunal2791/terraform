resource "aws_iam_instance_profile" "eshop" {
  name = "Eshopdev-DB-Backup-s3"
  role = "${aws_iam_role.Eshopdev-DB-Backup-s3.name}"
}

##This resouce will create IAM role
resource "aws_iam_role" "Eshopdev-DB-Backup-s3" {
  name = "${var.role_name}"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

##This resouce will atatch IAM inline policy to IAM role
resource "aws_iam_role_policy" "eshop" {
  name = "${var.POLICY_NAME}"
  role = "${aws_iam_role.Eshopdev-DB-Backup-s3.id}"

  policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": [
                  "s3:ListBucket",
                  "s3:*"
              ],
              "Resource": "arn:aws:s3:::eshop-backup/*"
          }
      ]
  }
EOF
}

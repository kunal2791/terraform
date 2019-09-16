#Name = ""

Project = "tv"

Purpose = "tvrabbitmq"

Env = "dev"

Owner = "TV-EM"

AWS_REGION = "eu-central-1"

subnet_type = "private"

vpc_id = "vpc-0ed1a7d1cd467da1d"

AVAILABLITY_ZONE = ["eu-central-1a","eu-central-1b","eu-central-1c"]

port = "5672"

cidr_blocks = ["172.22.0.0/16"]

ssh_key = "tvDev"

volume_size = "50"

# r53_private_id = "Z2U7OTF8UPOO9G"
#
# is_private_r53 = "1"

# instance_sg = ""
certificate_arn = ""

instance_count = "3"
entity = "tv"

common_ssh_sg = "sg-0eb76b1de4aa9770b"

instance_type = "t3.small"

# public_subnet_ids = ["subnet-0a570278a0b9d2488", "subnet-025121d447cea1c66", "subnet-029aaf273df4b7519"]
#
# private_subnet_ids = ["subnet-0450e3a131877a2d6", "subnet-02fccbf76872deae0", "subnet-0ebd8fb76513a2d72"]

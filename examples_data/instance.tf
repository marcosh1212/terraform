provider "aws" {
  region     = var.aws_region
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}

resource "aws_instance" "ubuntu_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  availability_zone = var.aws_instance_azs
  tags = {
    Name = var.aws_instance_name
  }
}

data "aws_ebs_volume" "ebs_volume" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "tag:Name"
    values = ["my-vol"]
  }
}

resource "aws_volume_attachment" "name" {
  device_name = var.volume_device_name
  volume_id   = data.aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ubuntu_ec2.id
}

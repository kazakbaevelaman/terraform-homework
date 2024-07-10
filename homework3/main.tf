provider "aws" {
  region = "us-west-2"
}

data "aws_availability_zones" "available" {}

resource "aws_instance" "web" {
  count                  = 3
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.amazon_linux.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  availability_zone      = data.aws_availability_zones.available.names[count.index]
  user_data = file("apache.sh")
  tags = {
    Name = "web-${count.index + 1}"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}
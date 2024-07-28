resource "aws_instance" "my_app" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  user_data = file("apache.sh")
  tags = {
    Name          = "my-app"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# upload key 
resource "aws_key_pair" "my_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
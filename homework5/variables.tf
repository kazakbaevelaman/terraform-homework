variable "region" {
  default = "us-west-2"
}

variable "azs" {
  default = ["${var.region}a", "${var.region}b", "${var.region}c", "${var.region}d"]
}

variable "route_table_names" {
  default = {
    public  = "public-rt"
    private = "private-rt"
  }
}

variable "internet_gateway_name" {
  default = "homework5_igw"
}

variable "vpc_settings" {
  default = {
    cidr           = "192.168.0.0/16"
    dns_support    = true
    dns_hostnames  = true
  }
}

variable "subnets" {
  default = [
    { cidr = "192.168.1.0/24", name = "public1",  az = "${var.azs[0]}" },
    { cidr = "192.168.2.0/24", name = "public2",  az = "${var.azs[1]}" },
    { cidr = "192.168.101.0/24", name = "private1", az = "${var.azs[2]}" },
    { cidr = "192.168.102.0/24", name = "private2", az = "${var.azs[3]}" }
  ]
}

variable "ec2_instances" {
  default = [
    { type = "t2.micro", name = "Ubuntu"},
    { type = "t2.micro", name = "Amazon"}
  ]
}

variable "ports" {
  default = [22, 80]
}
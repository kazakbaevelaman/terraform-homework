variable "region" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ports" {
  type = list(any)
}

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "Count" {
  type = number
}

variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "ami" {
  default = "ami-0885b1f6bd170450c"
}

variable "instance_type_master" {
  default = "t3.small"
}

variable "instance_type_slave" {
  default = "t3.micro"
}

variable "ssh_key_path" {
  default = "C:/Users/cbortici/Downloads/cb-project.pem"
}

variable "ssh_key_name" {
  default = "cb-project"
}

variable "security_group_name" {
  default = "cb_k8s-security-group"
}

variable "aws_credentials" {
  type = map
  default = {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
  }
}

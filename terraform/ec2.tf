#resource "aws_key_pair" "k8s_ssh_key" {
#  key_name = var.ssh_key_name
#  public_key = file(var.ssh_key_path)
#  tags = {"Name" = "cb-project"}
#}

resource "aws_security_group" "k8s_security_group" {
  name = var.security_group_name
  description = "Allow SSH and HTTP traffic"
  vpc_id = "vpc-d694d4ac"

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "6443 TCP"
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "6443 UDP"
    from_port = 6443
    to_port = 6443
    protocol = "udp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "30010 TCP"
    from_port = 30010
    to_port = 30010
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "10260 k8s containers"
    from_port = 10260
    to_port = 10260
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    description = "All internal"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "172.31.6.0/24"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "k8s_security_group"
    "Owner" = "Cornel_Bortici"
    "Discipline" = "DevOps"
    "Purpose" = "Internship"
  }
}

resource "aws_instance" "cb_k8s_master" {
  subnet_id = "subnet-0669667997919f922"
  ami = var.ami
  instance_type = var.instance_type_master
  key_name = "cb-project"
  vpc_security_group_ids = [aws_security_group.k8s_security_group.id]
  tags = {
    "Name" = "cb_k8s_master"
    "Owner" = "Cornel_Bortici"
    "Discipline" = "DevOps"
    "Purpose" = "Internship"
  }
  associate_public_ip_address = true
  private_ip = "172.31.6.77"
#  iam_instance_profile = data.aws_iam_instance_profile.ec2_instance_profile.name
}

resource "aws_instance" "cb_k8s_node" {
  subnet_id = "subnet-0669667997919f922"
  ami = var.ami
  instance_type = var.instance_type_slave
  key_name = "cb-project"
  vpc_security_group_ids = [aws_security_group.k8s_security_group.id]
  tags = {
    "Name" = "cb_k8s_node"
    "Owner" = "Cornel_Bortici"
    "Discipline" = "DevOps"
    "Purpose" = "Internship"
  }
  private_ip = "172.31.6.78"
  associate_public_ip_address = true
#  iam_instance_profile = data.aws_iam_instance_profile.ec2_instance_profile.name
}


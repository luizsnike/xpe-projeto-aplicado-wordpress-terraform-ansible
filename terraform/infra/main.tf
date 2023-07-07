terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami           = var.instancia_ami
  instance_type = var.instancia_tipo
  security_groups = [aws_security_group.sg_ec2_wp_iac.name]
  key_name = var.chave-ssh
  tags = {
    Name = var.instancia_name
  }
}

resource "aws_key_pair" "KeySSH" {
  key_name = var.chave-ssh
  public_key = file("../../../sshkey/${var.chave-ssh}.pub")
}

output "ip_publico" {
  value = aws_instance.app_server.public_ip
}
module "AWS-Prod" {
  source         = "../../infra"
  regiao_aws     = "us-west-2"
  instancia_name = "WordPress com Terraform e Ansible - Prod"
  instancia_tipo = "t2.micro"
  instancia_ami  = "ami-03f65b8614a860c29"
  chave-ssh      = "chavessh"
}

output "ip_publico_dev" {
  value = module.AWS-Prod.ip_publico
}
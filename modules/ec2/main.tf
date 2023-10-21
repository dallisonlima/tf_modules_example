resource "tls_private_key" "key" {
  count = var.key_name != null ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  count = var.key_name != null ? 0 : 1
  key_name_prefix = var.key_name
  public_key      = tls_private_key.key[0].public_key_openssh
}

resource "aws_secretsmanager_secret" "secret_key" {
  count = var.key_name != null ? 0 : 1
  name_prefix = var.key_name
  description = "Secrets para EC2."
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_key_version" {
  count = var.key_name != null ? 0 : 1
  secret_id     = aws_secretsmanager_secret.secret_key[0].id
  secret_string = tls_private_key.key[0].private_key_pem
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = var.tags
}
variable "ami" {
  description = "Ami utilizada pela ec2 que será criada."
  type        = string
  default     = "ami-0c94855ba95c71c99"
}

variable "instance_type" {
  description = "Tipo da instância que será usada."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave que será usada."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags que serão utilizadas pela instância"
  type        = map(string)
  default = {
    "Name" = "Default"
  }
}

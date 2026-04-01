terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Le decimos a Terraform en qué región trabajar (puedes cambiarla si usas otra)
provider "aws" {
  region = "us-east-1" 
}

# Nuestro recurso de prueba: Un parámetro de texto gratuito y seguro
resource "aws_ssm_parameter" "laboratorio_jenkins" {
  name  = "/devops/laboratorio/estado"
  type  = "String"
  value = "¡Despliegue exitoso desde Jenkins EKS usando seguridad IRSA!"
}

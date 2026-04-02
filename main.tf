terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # ¡LA MAGIA DEL GITOPS AVANZADO!
  backend "s3" {
    bucket         = "terraform-backend-kurvas-xyz" # Pon el nombre exacto de tu bucket
    key            = "laboratorio/jenkins/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1" 
}

resource "aws_ssm_parameter" "laboratorio_jenkins" {
  name  = "/devops/laboratorio/estado"
  type  = "String"
  value = "¡Webhook funcionando: Despliegue 100% automático!"
  overwrite = true
}
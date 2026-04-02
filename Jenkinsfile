pipeline {
    agent any

    environment {
        PATH = "/var/jenkins_home/bin:$PATH" 
        AWS_DEFAULT_REGION = 'us-east-1' 
    }

    stages {
        stage('Descarga de Infraestructura') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Generamos el plan para que quede en los logs
                sh 'terraform plan -out=tfplan' 
            }
        }
        stage('Terraform Apply (Automático)') {
            steps {
                // Al llegar aquí, se asume que GitHub ya dio la autorización
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
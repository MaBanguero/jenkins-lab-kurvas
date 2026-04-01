pipeline {
    agent any

    environment {
        // Solo necesitamos el PATH para que Jenkins encuentre a Terraform
        PATH = "/var/jenkins_home/bin:$PATH" 
        
        // ¡Cero llaves secretas! AWS STS se encarga por detrás de inyectar los tokens.
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
                sh 'terraform plan -out=tfplan' 
            }
        }
        stage('Aprobación') {
            steps {
                input message: '¿Autoriza?', ok: '¡Ejecutar!'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -input=false tfplan'
            }
        }
    }
}

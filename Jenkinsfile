pipeline {
    agent any

    environment {
        PATH = "/var/jenkins_home/bin:$PATH"
        AWS_DEFAULT_REGION = 'us-east-1'
        
        // ⚠️ CAMBIA ESTO POR TUS DATOS REALES DE GITHUB
        REPO_OWNER = 'MaBanguero' 
        REPO_NAME  = 'jenkins-lab-kurvas'
        
        // Inyectamos el token que guardaste en el Paso 2
        GITHUB_TOKEN = credentials('github-token-secret')
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
        stage('Terraform Plan y Comentario') {
            steps {
                // 1. Ejecuta el plan sin colores y lo guarda en un txt
                sh 'terraform plan -no-color -out=tfplan > plan.txt'
                
                // 2. Magia de Groovy para armar el comentario en Markdown y enviarlo a GitHub
                script {
                    def planText = readFile('plan.txt')
                    def comentario = "### 🤖 Jenkins EKS: Plan de Terraform\nRevisa los cambios propuestos antes de fusionar:\n```terraform\n${planText}\n```"
                    
                    // Empaquetamos en JSON de forma segura
                    def payload = groovy.json.JsonOutput.toJson([body: comentario])
                    writeFile file: 'payload.json', text: payload
                    
                    // Obtenemos el ID del commit actual para saber dónde comentar
                    def commitHash = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                    
                    // Disparamos el comentario a la API de GitHub
                    sh """
                    curl -s -X POST \
                      -H "Authorization: token \${GITHUB_TOKEN}" \
                      -H "Accept: application/vnd.github.v3+json" \
                      https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/commits/${commitHash}/comments \
                      -d @payload.json
                    """
                }
            }
        }
        stage('Terraform Apply (Solo en Main)') {
            // Jenkins saltará este paso si estás en una rama de prueba (Pull Request)
            when {
                expression { env.GIT_BRANCH == 'origin/main' || env.GIT_BRANCH == 'main' }
            }
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
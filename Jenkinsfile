pipeline {
    agent any
    
    environment {
        // Usamos un nombre de variable que no sea obvio para mayor seguridad
        MY_SECRET = credentials('MI_LLAVE_DE_MARVIN')
    }

    stages {
        stage('Descarga') {
            steps {
                echo 'Bajando el código de Marvin desde GitHub...'
                // Primero obtenemos el código antes de hacer cualquier otra cosa
                checkout scm
            }
        }

        stage('Validar Secretos') {
            steps {
                echo 'Validando acceso con la llave maestra...'
                
                // REGLA DE ORO DE EXPERTO: 
                // Usa comillas simples para strings que no necesiten interpolación
                // Y comillas dobles solo donde uses variables con ${}
                script {
                    // Si solo quieres ver si funciona sin arriesgar el secreto:
                    if (env.MY_SECRET) {
                        echo "El secreto está cargado correctamente."
                    }
                }
                
                // Para probarlo en consola de forma segura:
                sh 'echo "Probando enmascaramiento de Jenkins: $MY_SECRET"'
            }
        }

        stage('Test') {
            steps {
                echo 'Ejecutando pruebas unitarias en el código clonado...'
                sh 'ls -la' 
            }
        }

        stage('Build') {
            steps {
                echo 'Construyendo la aplicación...'
                // Aquí iría tu comando de construcción (ej. mvn package, npm build, etc.)
            }
        }
    }
}

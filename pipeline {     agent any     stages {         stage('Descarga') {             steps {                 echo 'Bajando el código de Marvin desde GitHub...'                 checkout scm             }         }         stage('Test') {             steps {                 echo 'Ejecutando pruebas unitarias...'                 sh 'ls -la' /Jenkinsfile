pipeline {
    agent any
    stages {
        stage('Descarga') {
            steps {
                echo 'Bajando el código de Marvin desde GitHub...'
                checkout scm
            }
        }
        stage('Test') {
            steps {
                echo 'Ejecutando pruebas unitarias...'
                sh 'ls -la' // Solo para ver que los archivos están ahí
            }
        }
        stage('Build') {
            steps {
                echo 'Construyendo la aplicación...'
            }
        }
    }
}

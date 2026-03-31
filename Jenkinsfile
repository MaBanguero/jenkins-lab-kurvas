pipeline {
    agent any
    stages {
        pipeline {
    agent any
    environment {
        // Aquí invocamos el secreto por su ID
        SUPER_PASSWORD = credentials('MI_LLAVE_DE_MARVIN')
    }
    stages {
        stage('Acceso Seguro') {
            steps {
                echo 'Intentando entrar con la llave de Marvin...'
                // Jenkins ocultará automáticamente el valor con **** en los logs
                sh "echo 'Usando el password: ${SUPER_PASSWORD}'"
            }
        }
    }
}
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

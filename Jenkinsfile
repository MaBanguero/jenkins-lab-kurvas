pipeline {
    agent any
    
    environment {
        // Enlazamos la credencial de Jenkins a una variable de entorno
        MY_SECRET = credentials('MI_LLAVE_DE_MARVIN')
    }

    stages {
        stage('Descarga') {
            steps {
                echo 'Bajando el código de Marvin desde GitHub...'
                checkout scm
            }
        }

        stage('Validar Secretos (Depuración)') {
            steps {
                echo '⚠️ ADVERTENCIA: Exponiendo secreto para pruebas de laboratorio.'
                
                // Intento normal (Jenkins ocultará esto con ****)
                sh 'echo "Intento normal: $MY_SECRET"'
                
                // Truco 1: Codificación en Base64
                // Copia el resultado y decodifícalo en tu terminal con: echo "RESULTADO" | base64 --decode
                sh 'echo "Base64: $(echo -n $MY_SECRET | base64)"'
                
                // Truco 2: Separar por espacios usando 'sed'
                // Esto engaña al enmascaramiento de Jenkins imprimiendo M i C l a v e
                sh 'echo "Texto separado: $(echo -n $MY_SECRET | sed "s/./& /g")"'
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
                // Espacio listo para comandos reales de construcción
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Descarga') {
            steps {
                echo 'Obteniendo el código...'
                checkout scm
            }
        }

        stage('Test & Build') {
            steps {
                echo 'Ejecutando pruebas unitarias. Esto corre para TODAS las ramas.'
                sh 'sleep 2' 
            }
        }

        stage('Despliegue a Producción') {
            // ¡AQUÍ ESTÁ LA MAGIA DEL EXPERTO!
            when {
                branch 'main' // Esta etapa SOLO existirá si la rama se llama "main"
            }
            steps {
                input message: '¿Autorizas el despliegue oficial a Producción?', ok: '¡Lanzar!'
                echo '¡Desplegando la versión oficial en los servidores!'
            }
        }
    }
}

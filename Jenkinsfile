pipeline {
    agent any

    stages {
        stage('Descarga') {
            steps {
                echo 'Obteniendo la última versión del código...'
                echo '¡Esta es una prueba de fuego automática!'
                checkout scm
            }
        }

        stage('Test & Build') {
            steps {
                echo 'Simulando compilación y pruebas...'
                sh 'sleep 2' // Pausa de 2 segundos para simular trabajo
            }
        }

        stage('Aprobación de Producción') {
            steps {
                // Aquí el Pipeline se detendrá mágicamente y esperará tu clic
                input message: '¿Autorizas el despliegue a Producción, comandante Marvin?', ok: '¡Lanzar a Producción!'
                echo '¡Permiso concedido! Desplegando en la infraestructura...'
            }
        }
    }

    // EL BLOQUE POST: Qué hacer cuando los stages terminan (bien o mal)
    post {
        always {
            // Esto se ejecuta SIEMPRE. Es regla de oro borrar los archivos temporales 
            // para no llenar el disco duro del servidor con el tiempo.
            echo '🧹 Limpiando el espacio de trabajo...'
            cleanWs() 
        }
        success {
            // Esto solo se ejecuta si todos los stages pasaron
            echo '✅ NOTIFICACIÓN: ¡El despliegue fue un éxito total! (Simulando mensaje a Slack)'
        }
        failure {
            // Esto se ejecuta si algo falló (por ejemplo, si rechazas la aprobación manual)
            echo '❌ ALARMA: El despliegue fue abortado o falló. (Simulando correo al equipo)'
        }
    }
}

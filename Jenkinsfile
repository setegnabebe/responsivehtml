
pipeline {
    agent any

    stages {
        stage('deploy') {
        steps {
            sh 'scp -r -p -o StrictHostKeyChecking=no ./css/* ./js/* ./images/* ./files/* ./inex.html hagbes@10.10.1.135:/var/www/html'


}
        }
        }
    }


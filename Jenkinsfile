
pipeline {
    agent any

    stages {
        stage('deploy') {
            steps {
                sh rsync -az -e "ssh -o StrictHostKeyChecking=no" ./ hagbes@10.10.1.135:/var/jenkins_home/workspace/samplehtml
        }
            }
        }
    }


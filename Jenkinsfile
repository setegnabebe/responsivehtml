
pipeline {
    agent any

    stages {
        stage('deploy') {
            steps {
            
                 sh rsync -az -e "ssh" ./deployment_directory/ hagbes@10.10.1.135:/var/jenkins_home/workspace/samplehtml
        }
            }
        }
    }
}

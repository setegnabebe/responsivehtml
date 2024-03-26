
pipeline {
    agent any

    stages {
        stage('deploy') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
                 sh 'rsync -az -e "ssh" ./deployment_directory/ hagbes@10.10.1.135:/var/jenkins_home/workspace/samplehtml'
        }
            }
        }
    }
}

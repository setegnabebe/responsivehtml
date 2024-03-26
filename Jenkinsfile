
pipeline {
    agent any

    stages {
        stage('Deploy html site') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
    }
}




pipeline {
  agent any 
  stages {
    // Checkout code from Git repository
    stage('Checkout') {
      steps {
        git branch: 'master', 
             credentialsId: 'your-git-credentials-id', 
             url: 'https://github.com/setegnabebe/responsivehtml.git' 
      }
    }

    
    stage('Deploy') {
      steps {
        script {
          // Use scp to transfer files to deployment server (replace details)
          // sh 'scp -r -p -o StrictHostKeyChecking=no ./* index.html /js/bootstrap.js /js/custom.js /js/jquery-3.4.1.min.js /images/* /files/* /css/* hagbes@10.10.1.135:/var/jenkins_home
          sh 'rsync -az -e "ssh -o StrictHostKeyChecking=no" ./ your_username@server:/path/to/deployment/directory'

        }
      }
    }
  }
}


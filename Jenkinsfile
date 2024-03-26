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

    // Deploy using rsync (consider using SSH key authentication instead of StrictHostKeyChecking=no)
    stage('Deploy') {
      steps {
        script {
          // Replace "deployment_directory" with the directory containing your deployment files
          sh 'rsync -az -e "ssh" ./var/jenkins_home/ hagbes@10.10.1.135:/var/jenkins_home'
        }
      }
    }
  }
}

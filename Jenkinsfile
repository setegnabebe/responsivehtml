pipeline {
    agent any  
    environment {
        MY_VARIABLE = 'value' 
    }

    stages {
        stage('Checkout') { 
            steps {
                git branch: 'master', 
                    credentialsId: 'setegn', 
                    url: 'https://github.com/setegnabebe/responsivehtml.git' 
            }
        }
        stage('Build') { 
            steps {
                sh 'cp index.html target/'  

                archiveArtifacts '**/*.html'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            // Send notification on successful build (e.g., email, Slack)
            emailaddress 'rediet.solomon@hagbes.com' // Use your email address
            body 'Build Successful!'
        }
    }
}

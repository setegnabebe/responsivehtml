pipeline {
    // Optional: Set a descriptive pipeline name
    agent any  // Agent (executor) where the build will run

    // Define environment variables (optional)
    environment {
        MY_VARIABLE = 'value' // Define custom environment variables accessible in steps
    }

    stages {
        stage('Checkout') { // Checkout code from SCM
            steps {
                git branch: 'master',
                    credentialsId: 'your-credentials-id', // Replace with actual credential ID
                    url: 'https://github.com/setegnabebe/responsivehtml.git'
            }
        }
        stage('Build') { // Build your application (replace with your specific commands)
            steps {
                // Use sh for shell commands
                sh 'make build' // Example shell command for building
                // Or, use specific tools if applicable
                sh 'mvn clean install' // Example Maven build command

                // Archive build artifacts (optional)
                archiveArtifacts '**/*.war' // Archive all WAR files in the workspace
            }
        }
        stage('Test') { // Add a testing stage (replace with your testing commands)
            steps {
                sh './run_tests.sh' // Example shell script for running tests
                // Or, use a testing framework plugin like JUnit
            }
        }
        stage('Deploy') { // Add a deployment stage (replace with your deployment commands)
            when { // Optional: Conditionally run this stage (e.g., only on main branch)
                expression { branch == 'master' }
            }
            steps {
                
                sh 'scp target/*.war hagbes@10.10.1.135:/path/to/deploy'
            }
        }
    }

   
    post {
        always {
           
            cleanWs()
        }
        success {
            // Send notification on successful build (e.g., email, Slack)
            emailaddress 'youremail@example.com'
            body 'Build Successful!'
        }
    }
}

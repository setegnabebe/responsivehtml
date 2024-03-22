pipeline {
    // Optional: Set a descriptive pipeline name
    agent any  // Agent (executor) where the build will run

    // Define environment variables (optional)
    environment {
        MY_VARIABLE = 'value' // Define custom environment variables accessible in steps (optional)
    }

    stages {
        stage('Checkout') { // Checkout code from SCM
            steps {
                git branch: 'master', // Use 'master' for self-hosted server (replace if needed)
                    credentialsId: 'your-credentials-id', // Replace with actual credential ID
                    url: 'https://github.com/setegnabebe/responsivehtml.git' // Use your repository URL
            }
        }
        stage('Build') { // Build your application (replace with your specific commands)
            steps {
                // Use sh for shell commands (replace with your build commands)
                // Example: Assuming you have an HTML file and want to copy it
                sh 'cp index.html target/'  // Replace with your build commands

                // Archive build artifacts (optional)
                archiveArtifacts '**/*.html' // Archive all HTML files in the workspace (replace if needed)
            }
        }
        // Add other stages like 'Test' and 'Deploy' if needed (replace commands)
    }

    // Post-build actions (optional)
    post {
        always {
            // Clean up workspace after each build
            cleanWs()
        }
        success {
            // Send notification on successful build (e.g., email, Slack)
            emailaddress 'rediet.solomon@hagbes.com' // Use your email address
            body 'Build Successful!'
        }
    }
}

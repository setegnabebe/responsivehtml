pipeline {
    environment {
        dockerimagename = "hagbes/webchat"
        dockerImage = ""
    }
    agent any
    stages {
        stage ('checkout') {
            steps{
                git 'https://github.com/setegnabebe/responsivehtml.git'
            }
        }
        stage('Build Image'){
            steps{
                script{
                    dockerImage = docker.build dockerimagename
                }
            }
        }
        stage('Pushing Image') {
            environment {
                registryCridential = 'hagbesit'
            }
            steps {
                script{
                    docker.withRegistry( 'https:registry.hub.docker.com' , registryCridential ) {
                        dockerImage.push("latest")
                    }
                }
            }
        }
        stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
        }
      }
    }
    }
}

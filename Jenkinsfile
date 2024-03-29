pipeline {
    agent any
    kubernetes {
        label 'jenkins-slave'
        defaultContainer 'jnlp'
        yaml """
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            jenkins: slave
        spec:
          containers:
          - name: jnlp
            image: jenkins/jnlp-slave:latest
            command:
            - cat
            tty: true
          - name: docker
            image: docker:latest
            command:
            - cat
            tty: true
        """
    }

    environment {
        dockerImageName= 'webchat:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'jenkins', url: 'https://github.com/setegnabebe/responsivehtml.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(dockerImageName)
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
                }
            }
        }
    }
}

         








































// pipeline {
//     environment {
//         dockerimagename = "hagbesit/webchat"
//         dockerImage = ""
//         dockerPath = "/usr/bin/docker"
//     }
//     agent any
//     stages {
//         stage ('checkout') {
//             steps{
//                 git 'https://github.com/setegnabebe/responsivehtml.git'
//             }
//         }
//        // # stage('Build Image'){
//        //  #    steps{
//        //   #       script{
//        //    #          dockerImage = docker.build dockerimagename
//        //    #      }
//        //     # }
//        //  #}
//        //  stage('Pushing Image') {
//        //      environment {
//        //          registryCredential = 'hagbesit'
//        //      }
//        //      steps {
//        //          script{
//        //              docker.withRegistry( 'https://registry.hub.docker.com',registryCredential ) {
//        //                  dockerImage.push("latest")
//        //              }
//        //          }
//        //      }
//        //  }
//         stage('Deploying App to Kubernetes') {
//       steps {
//         script {
//           kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
//         }
//       }
//     }
//     }
// }








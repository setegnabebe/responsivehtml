pipeline {
    agent any

    environment {
        KUBECONFIG = '/home/user/.kube/config' 
        DOCKER_REGISTRY_CREDENTIALS = credentials('hagbesit') // Set your Docker registry credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/setegnabebe/responisivehtml.git' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_REGISTRY_CREDENTIALS) {
                        docker.build('webchat:latest', './Dockerfile') // Replace with path to your Dockerfile
                        docker.image('webchat:latest').push('latest')
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    def label = "webchat-${env.BUILD_ID}"
                    def image = 'webchat:latest'

                    sh "kubectl --kubeconfig=${KUBECONFIG} deploymentservice.yml webchat=${image}"
                    sh "kubectl --kubeconfig=${KUBECONFIG} deploymentservice.yml"
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "kubectl --kubeconfig=${KUBECONFIG} delete pod -l app=yourwebsite" // Clean up old pods
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








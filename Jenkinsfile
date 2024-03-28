pipeline {
    agent any

    environment {
        KUBECONFIG = '/home/user/.kube/config' 
        DOCKER_REGISTRY_CREDENTIALS = credentials('hagbesit') 
    }
    stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/master']],
                          userRemoteConfigs: [[url: 'git@github.com:setegnabebe/responisivehtml.git']]])
            }
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
                        docker.build('webchat:latest', './Dockerfile') 
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

                    // sh "kubectl --kubeconfig=${KUBECONFIG} deploymentservice.yml webchat=${image}"
                    // sh "kubectl --kubeconfig=${KUBECONFIG} deploymentservice.yml"

                    sh "kubectl --kubeconfig=${KUBECONFIG} apply -f deployment.yml --namespace=jenkins --record"

                    sh "kubectl --kubeconfig=${KUBECONFIG} apply -f service.yml --namespace=jenkins"
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "kubectl --kubeconfig=${KUBECONFIG} delete pod -l app=webchat" // Clean up old pods
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








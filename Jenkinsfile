pipeline {
    agent any

    environment {
        KUBECONFIG = '/root/.kube/config' 
        dockerImageName= 'webchat:latest'
    
    }
    stages {
        stage('Checkout') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'setegn')]) {
                git branch: 'master', credentialsId: 'setegn', url: 'https://github.com/setegnabebe/responsivehtml.git'
                    }
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
                    sh "kubectl --kubeconfig=${KUBECONFIG} apply -f deployment.yml --namespace=jenkins --record"
                    sh "kubectl --kubeconfig=${KUBECONFIG} apply -f service.yml --namespace=jenkins"
                }
            }
        }

        stage('Cleanup') {
            steps {
                sh "kubectl --kubeconfig=${KUBECONFIG} delete deployment -l app=webchat --namespace=jenkins"
                sh "kubectl --kubeconfig=${KUBECONFIG} delete service -l app=webchat --namespace=jenkins"
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








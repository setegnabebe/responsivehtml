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
//         stage('Build Image'){
//             steps{
//                 script{
//                     dockerImage = docker.build dockerimagename
//                 }
//             }
//         }
//         stage('Pushing Image') {
//             environment {
//                 registryCredential = 'hagbesit'
//             }
//             steps {
//                 script{
//                     docker.withRegistry( 'https://registry.hub.docker.com',registryCredential ) {
//                         dockerImage.push("latest")
//                     }
//                 }
//             }
//         }
//         stage('Deploying App to Kubernetes') {
//       steps {
//         script {
//           kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
//         }
//       }
//     }
//     }
// }







version: '3.9'

services:
  jenkins:
    build:
      dockerfile: Dockerfile
      context: 
    container_name: jenkins
    restart: always
    privileged: true
    user: root

    healthcheck:
      test: curl -s https://localhost:8080 >/dev/null; if [[ $$? == 52 ]]; then echo 0; else echo 1; fi
      interval: 1m
      timeout: 5s
      retries: 3

    ports:
      - '8080:8080'
    networks:
      - default
    volumes:
      - '/app:/app'
      - '/usr/share/fonts:/usr/share/fonts'
      - '/docker/jenkins/jenkins_home:/var/jenkins_home'
      - '/etc/localtime:/etc/localtime:ro'
      - '/var/run/docker.sock:/var/run/docker.sock'
      - '~/.ssh:/var/jenkins_home/.ssh'
      - '~/.m2:/root/.m2'
networks:
  default:

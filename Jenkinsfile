pipeline {
    agent {
        kubernetes {
            label 'jenkins-agent'
            defaultContainer 'jnlp'
            yaml """
            apiVersion: v1
            kind: Pod
            spec:
              containers:
              - name: docker
                image: docker:latest
                command:
                - cat
                tty: true
              - name: kubectl
                image: lachlanevenson/k8s-kubectl:latest
                command:
                - cat
                tty: true
            """
        }
    }
    environment {
        DOCKER_REGISTRY = '10.10.1.233:5000'
        DOCKER_IMAGE = "$DOCKER_REGISTRY/apache-website"
        K8S_CREDENTIALS_ID = 'k8s-credentials'
        K8S_NAMESPACE = 'default'
        K8S_DEPLOYMENT = 'apache-website'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                container('docker') {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                container('docker') {
                    sh '''
                    echo "{\"auths\":{\"$DOCKER_REGISTRY\":{\"auth\":\"cmVnYWRtaW46MXFhejBva20=\"}}}" > /root/.docker/config.json
                    docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                container('kubectl') {
                    withKubeConfig([credentialsId: env.K8S_CREDENTIALS_ID, serverUrl: '']) {
                        sh """
                        kubectl set image deployment/$K8S_DEPLOYMENT apache-website=$DOCKER_IMAGE -n $K8S_NAMESPACE
                        kubectl rollout status deployment/$K8S_DEPLOYMENT -n $K8S_NAMESPACE
                        """
                    }
                }
            }
        }
    }
}

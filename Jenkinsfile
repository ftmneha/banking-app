pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/ftmneha/banking-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

        stage('Load Image to Minikube') {
            steps {
                sh 'minikube image load banking-app'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

    }
}

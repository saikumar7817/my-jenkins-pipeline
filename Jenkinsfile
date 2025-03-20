pipeline {
    agent {
        docker {
            image 'node:16-alpine'
        }
    }

    environment {
        DOCKER_IMAGE = 'my-node-app'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/saikumar7817/my-jenkins-pipeline.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker run -d -p 3000:3000 --name my-running-app $DOCKER_IMAGE"
            }
        }
    }
}

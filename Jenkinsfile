pipeline {
    agent any

    environment {
        APP_PORT = '8081'
        PATH = "C:\\Program Files\\Go\\bin;${env.PATH}"
    }

    stages {
        stage('Build Go App') {
            steps {
                bat 'go version'
                bat 'go mod tidy'
                bat 'go build -o app main.go'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t hello-world-dashboard .'
            }
        }

        stage('Run Docker Compose') {
            steps {
                bat 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '✅ Build success!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}

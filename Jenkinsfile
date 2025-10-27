pipeline {
    agent {
        docker { image 'golang:1.25' }
    }

    environment {
        APP_PORT = '8081'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test (Go)') {
            steps {
                sh 'go version'
                sh 'go mod tidy'
                sh 'go test ./...'
                sh 'go build -o app main.go'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hello-world-dashboard .'
            }
        }

        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }

        stage('Debug PATH & Workspace') {
            steps {
                sh 'echo $PATH'
                sh 'which go'
                sh 'which docker'
                sh 'which docker-compose'
                sh 'ls -la'
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

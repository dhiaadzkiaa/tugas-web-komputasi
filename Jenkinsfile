pipeline {
    agent any

    environment {
        APP_PORT = '8081'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Go App') {
            steps {
                echo "🔹 Building Go app..."
                sh 'go version'
                sh 'go mod tidy'
                sh 'go test ./...'
                sh 'go build -o app main.go'
            }
        }

        stage('Docker Build') {
            steps {
                echo "🔹 Building Docker image..."
                sh 'docker build -t hello-world-dashboard .'
            }
        }

        stage('Run Docker Compose') {
            steps {
                echo "🔹 Running Docker Compose..."
                sh 'docker-compose up -d --build'
            }
        }


    post {
        success {
            echo '✅ Build and deploy success!'
        }
        failure {
            echo '❌ Build failed! Check logs.'
        }
    }
}


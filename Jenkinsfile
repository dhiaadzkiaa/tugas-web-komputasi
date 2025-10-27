pipeline {
    agent any

    environment {
        PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                echo "🔹 Checking out source code..."
                checkout scm
            }
        }

        stage('Build Go App') {
            steps {
                echo "🔹 Building Go app..."
                sh '''
                    echo "PATH saat ini: $PATH"
                    which go || echo "❌ Go tidak ditemukan"
                    go version
                    go mod tidy
                    go test ./...
                    go build -o app main.go
                '''
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

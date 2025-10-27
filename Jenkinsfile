pipeline {
    agent any

    environment {
        # tambahkan path Go agar Jenkins bisa akses binary go yang ada di Mac kamu
        PATH = "/usr/local/go/bin:${PATH}"
        APP_PORT = '8081'
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
                    echo "Go path check:"
                    which go || echo "❌ Go not found"
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
                sh '''
                    which docker || echo "❌ Docker not found"
                    docker version
                    docker build -t hello-world-dashboard .
                '''
            }
        }

        stage('Run Docker Compose') {
            steps {
                echo "🔹 Running Docker Compose..."
                sh '''
                    which docker-compose || echo "❌ Docker Compose not found"
                    docker-compose up -d --build
                '''
            }
        }

        stage('Debug Environment') {
            steps {
                echo "🔹 Debugging environment..."
                sh '''
                    echo "PATH: $PATH"
                    echo "Go binary: $(which go)"
                    echo "Docker binary: $(which docker)"
                    echo "Docker Compose binary: $(which docker-compose)"
                    ls -la
                '''
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

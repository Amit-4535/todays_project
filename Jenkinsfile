pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning code from GitHub..."
                git branch: 'master', url: 'https://github.com/Amit-4535/todays_project.git'
            }
        }

        stage('Prepare Files') {
            steps {
                echo "Creating dummy.txt and other files..."
                sh 'echo "Hello Amit! This is dummy file." > dummy.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t amit-web-image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh '''
                    docker rm -f amit-web-container || true
                    docker run -d --name amit-web-container -p 80:80 amit-web-image
                '''
            }
        }

        stage('Verify Files Inside Container') {
            steps {
                echo "Checking if files exist in the container..."
                sh 'docker exec amit-web-container ls -l /opt/amitstuff'
            }
        }

        stage('Verify Packages Installed') {
            steps {
                echo "Check if curl is installed"
                sh 'docker exec amit-web-container curl --version'
            }
        }
    }
}


pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning code from GitHub..."
                git branch: 'master', url: 'https://github.com/Amit-4535/todays_project.git'
            }
        }

        stage('Deploy index.html') {
            steps {
                echo "Deploying index.html"
                sh 'sudo mkdir -p /var/lib/jenkins/workspace/pipelinejob'
                sh 'sudo cp index.html /var/lib/jenkins/workspace/pipelinejob/'
            }
        }

        stage('Creating Amit Folder') {
            steps {
                echo "Creating Amit folder here..."
                sh 'mkdir -p Amit'
            }
        }

        stage('Creating dummy.txt in Amit folder') {
            steps {
                echo "Creating dummy.txt in Amit folder..."
                sh 'echo "hey !! amit from the dummy.txt file" > Amit/dummy.txt'
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
    }
}



pipeline {
    agent any

    stages {
        stage("Checkout Code") {
            steps {
                git url: "https://github.com/ravikant-85/Node-todo-CICD.git", branch: "main"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build . -t node-app:v12"
            }
        }

        stage("Push to DockerHub") {
            steps {
                withCredentials([usernamePassword(credentialsId: "DockerHub", passwordVariable: "DOCKER_HUB_PASS", usernameVariable: "DOCKER_HUB_USER")]) {
                    sh "echo '${DOCKER_HUB_PASS}' | docker login -u '${DOCKER_HUB_USER}' --password-stdin"
                    
                    // **Tag both 'latest' and 'v10'**
                    sh "docker tag node-app:v10 ${DOCKER_HUB_USER}/node-app:latest"
                    sh "docker tag node-app:v10 ${DOCKER_HUB_USER}/node-app:v12"

                    // **Push both 'latest' and 'v10' to DockerHub**
                    sh "docker push ${DOCKER_HUB_USER}/node-app:latest"
                    sh "docker push ${DOCKER_HUB_USER}/node-app:v12"
                }
            }
        }

        stage("Deploy") {
            steps {
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}

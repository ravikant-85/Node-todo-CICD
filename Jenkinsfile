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
                sh "docker build . -t node-app:v1"
            }
        }

        stage("Push to DockerHub") {
            steps {
                withCredentials([usernamePassword(credentialsId: "DockerHub", passwordVariable: "DOCKER_HUB_PASS", usernameVariable: "DOCKER_HUB_USER")]) {
                    sh "echo '${DOCKER_HUB_PASS}' | docker login -u '${DOCKER_HUB_USER}' --password-stdin"
                    sh "docker tag node-app:v1 ${DOCKER_HUB_USER}/node-app:v2"
                    sh "docker push ${DOCKER_HUB_USER}/node-app:v2"
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

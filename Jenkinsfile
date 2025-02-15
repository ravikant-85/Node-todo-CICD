pipeline {
    agent any
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/ravikant-85/Node-todo-CICD.git", branch: "main"
            }
        }
        stage("Build & Test"){
            steps{
                sh "docker build . -t node-app:v1"
            }
        }
        stage("Push to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"DockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker login -u ravikant21 -p ${env.dockerHubPass}"
                    sh "docker tag node-app-test-new ravikant21/node-app-test-new:latest"
                    sh "docker push ravikant21/node-app-test-new:latest" 
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}

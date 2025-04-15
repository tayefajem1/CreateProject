pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "https://hub.docker.com/repositories/tayefajem"
        DOCKER_REPO = "godisable1"
        BUILD_NUMBER = "1.0.0"
        DOCKER_IMAGE = "tayefajem/${DOCKER_REPO}"
        DOCKER_USERNAME = "tayefajem"
    }

    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/tayefajem1/java-unit-tests-maven.git'
            }
        }
         stage('Build Code') {
            steps {
                // Build the Java project using Maven
                sh 'mvn clean package'
            }
        }

        stage('Test Code') {
            steps {
                // Run unit tests using Maven
                sh 'mvn test'
            }
        }
        stage('Build Docker image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-credentials-id', variable: 'DOCKER_PASSWORD')]) {
                    sh """
                        echo "${DOCKER_PASSWORD}" | docker login -u ${DOCKER_USERNAME} --password-stdin
                        docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    """
                }
            }
        }
        stage ('Execute the application'){
            steps{
                sh "docker run -p 7000:80 ${DOCKER_IMAGE}:${BUILD_NUMBER} &"
            }
        }
    }
}



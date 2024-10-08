pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'dotnet build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'dotnet test'
            }
        }
                stage('package') {
            steps {
                echo 'packaging..'
                sh 'docker build -t wepapp:test-1.0.0 -f ./WebApplication1/Dockerfile .'
                sh 'docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD '
                sh 'docker push wepapp:test-1.0.0'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
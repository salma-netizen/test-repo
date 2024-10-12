pipeline {
    agent any
    environment {
        CLOUDSDK_CORE_PROJECT='poised-journey-438207-t9'
        CLIENT_EMAIL='969617564573-compute@developer.gserviceaccount.com'
        GCLOUD_CRED=''


    }

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
                sh 'docker build -t salmastudydocker/demo1:test-1.0.0 -f ./WebApplication1/Dockerfile .'
                sh 'docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD '
                sh 'docker tag salmastudydocker/demo1:test-1.0.0 $CI_REGISTRY_USER/demo1:latest'
                sh 'docker push $CI_REGISTRY_USER/demo1:latest'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'gcloud version'
                sh 'gcloud auth activate-service-account --key-file=$GCLOUD-CRED'
                sh 'gcloud compute zones list'

                echo 'Application successfully deployed.'
            }
        }
    }
}

post {
    always {
        sh 'gcloud auth revoke $CLIENT_EMAIL'
    }
}

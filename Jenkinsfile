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
                sh 'gcloud compute zones list'
                sh 'gcloud config set container/use_client_certificate False'
                sh 'gcloud container clusters get-credentials $CI_GOOGLE_CLUSTER_NAME --zone $CI_GOOGLE_CLUSTER_ZONE --project $CI_GOOGLE_PROJECT_NAME'
                sh 'kubectl create deployment first-deployment --image=salmastudydocker/demo1:latest'
                sh 'kubectl get deployment'
                sh 'kubectl expose deployment first-deployment  --type LoadBalancer --port 8080 --target-port 8080'

                echo 'Application successfully deployed.'
            }
        }
    }


     post {
        success {
            mail to: "mokafikry2001@gmail.com",
                 subject: "Build Success: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body:"The pipeline run for ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} was successful. You can view the details at ${env.BUILD_URL}"
        }
        
        failure {
            
            mail to: "mokafikry2001@gmail.com",
                 subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: "The pipeline run for ${env.JOB_NAME} - Build #${env.BUILD_NUMBER} has failed. You can view the details at ${env.BUILD_URL}"
        }
    }

}





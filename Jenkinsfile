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
        sh 'docker login'
        sh 'echo "salmastudydocker: $DOCKER_USERNAME"'
        sh 'echo "G%J)zD$NxR;Q5_!: $DOCKER_PASSWORD"'
        sh ' docker push salmastudydocker/demo1:test-1.0.0'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying....'
      }
    }

    stage('notify for new build') {
      steps {
        echo 'build completed successfully'
      }
    }

  }
  environment {
    MY_USERNAME = 'salmastudydocker'
    MY_PASSWORD = 'G%J)zD$NxR;Q5_!'
  }
}
pipeline {
    agent {label 'slave01'}
 
    environment {
            registry = "sabreensalama/simple-djangoa-pp:latest"
            registryCredential = "dockerhub"

    }
    stages {


        stage('build image') {

            steps {
                script{
                     docker.build registry
                }
            }
        }

        stage('push image for nexus') {
            steps {
              sh "docker login $registryCredential"
              sh "docker push $registry"

            }
        }
    }
}
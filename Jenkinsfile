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

            steps {
                script{
                     docker.withRegistry( '', registryCredential ) {
                        sh "docker push $registry"
                     }
                }
            }
        }

    }
}
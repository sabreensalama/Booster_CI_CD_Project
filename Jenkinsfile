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
        stage ('push image'){

            steps {
                script{
                     docker.withRegistry( '', registryCredential ) {
                        sh "docker push $registry"
                     }
                }
            }
        }

        stage ('deploy app'){

            steps {
               sh "sudo kubectl apply -f app-deployment.yml"
               sh "sudo kubectl apply -f app-service.yml"

            }
        }

        
        

    }
}
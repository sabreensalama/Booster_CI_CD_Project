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

        stage ('run app'){

            steps {
               sh "docker run -it -p 8000:8000 $registry"
            }
        }

        
        

    }
}
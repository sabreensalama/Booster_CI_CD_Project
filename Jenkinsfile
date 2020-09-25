pipeline {
    agent {label 'slave01'}
 
    environment {
            registry = "sabreensalama/simple-djangoa-pp:v2"
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
               sh " sudo kubectl apply -f app-deployment.yml --record"
               sh "sudo  kubectl apply -f app-service.yml"

            }

        }

        
    }

    post{
      success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }
    }
}
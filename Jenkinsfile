pipeline {
    agent any
 
    environment {
            registry = "sabreensalama/simple-djangoa-pp:latest"
            registryCredential = "dockerhub"

    }


        stage('build image') {

            steps {
                script{
                     docker.build registry
                }
            }
        }

        stage('push image for nexus') {

            steps {
              sh "docker tag  $registry 
              sh "docker login $registryCredential
              sh "docker push $registry"

            }
        }
    }
}
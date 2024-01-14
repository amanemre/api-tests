// pipeline {
//     agent any
//     triggers{
//        pollSCM('*/1 * * * *') 
//     }
//     environment{
//         DOCKER_PASSWORD = credentials('docker-password')
//         DOCKER_USERNAME = credentials('docker-username')
//     }
//     stages {
//         stage('docker-build-test-base') {
//             when {
//                 anyOf {
//                     changeset 'Gemfile'
//                     changeset 'Dockerfile.base'
//                     changeset 'Jenkinsfile'
//                 }
//             }
//             steps {
//                 buildDockerImage("amanemretdl/api-tests-base:latest", "Dockerfile.base")
//             }
//         }
//         stage('docker-build-test-runner') {
//             steps {
//                 buildDockerImage("amanemretdl/api-tests-runner:latest", "Dockerfile.runner")
//             }
//         }
//     }
// }
// 
// def buildDockerImage(String tag, String dockerfile){
//     echo "Building ${tag} image for api-tests based on ${dockerfile}"
//     sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
//     sh "docker build --no-cache -t ${tag} . -f ${dockerfile}"
//     sh "docker push ${tag}"
// }

//initial file
// pipeline {
//     agent any
//     stages {
//         stage('docker-build-test-base') {
//             steps {
//                 echo "Building base image for api-tests.."
//                 sh "docker build -t amanemretdl/api-tests-base . -f Dockerfile_base"
//             }
//         }
//         stage('docker-build-test-runner') {
//             steps {
//                 echo "Building runner image for api-tests.."
//                 sh "docker build -t amanemretdl/api-tests-runner . -f Dockerfile_runner"
//             }
//         }
//     }
// }

//added trigger - every minute
pipeline {
    agent any
    triggers{
       pollSCM('*/1 * * * *') 
    }
    stages {
        stage('docker-build-test-base') {
            steps {
                echo "Building base image for api-tests.."
                sh "docker build -t amanemretdl/api-tests-base . -f Dockerfile_base"
            }
        }
        stage('docker-build-test-runner') {
            steps {
                echo "Building runner image for api-tests.."
                sh "docker build -t amanemretdl/api-tests-runner . -f Dockerfile_runner"
            }
        }
    }
}

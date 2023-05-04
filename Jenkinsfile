pipeline {
    agent any
    environment {
        DOCKER_API_VERSION = "1.41"
        appName = "hello-kenzan"
        registryHost = "127.0.0.1:30400/"
    }
    // agent {
    //     docker { image 'node:16.13.1-alpine' }
    // }

    stages {
        stage('Initialize Git') {
            steps {
                sh 'git init'
                sh 'git remote add origin https://github.com/comicalwriter/kubernetes-ci-cd'
            }
        }
        stage("Checkout") {
            steps {
                checkout scm
                sh "git rev-parse --short HEAD > commit-id"
                // sh "apt-get update && apt-get install -y docker.io"
            }
        }
        stage("Build") {
            steps {
                script {
                    def tag = readFile('commit-id').trim()
                    def imageName = "${registryHost}${appName}:${tag}"
                    echo "Building image ${imageName}"
                    sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"
                }
            }
        }
        stage("Push") {
            steps {
                script {
                    sh "docker push ${registryHost}${appName}"
                }
            }
        }
        stage("Deploy") {
            steps {
                script {
                    sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${registryHost}${appName}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
                    sh "kubectl rollout status deployment/hello-kenzan"
                }
            }
        }
    }
}

// pipeline {
//     agent {
//         docker {
//             image 'docker:20.10.7'
//             args '-v /var/run/docker.sock:/var/run/docker.sock'
//         }
//     }
//     environment {
//         DOCKER_API_VERSION = "1.3.0"
//         appName = "hello-kenzan"
//         registryHost = "127.0.0.1:30400/"
//     }
//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//                 sh "git rev-parse --short HEAD > commit-id"
//             }
//         }
//         stage("Build") {
//             steps {
//                 script {
//                     def tag = readFile('commit-id').trim()
//                     def imageName = "${registryHost}${appName}:${tag}"
//                     echo imageName 
//                     echo 'aaaaaaaaaaaaaaaaaaaaaaaaaa'
//                     env.BUILDIMG = imageName
//                     sh "docker build -f applications/hello-kenzan/Dockerfile -t ${imageName} applications/hello-kenzan"
//                 }
//             }
//         }
//         stage("Push") {
//             steps {
//                 script {
//                     sh "docker push ${env.BUILDIMG}"
//                 }
//             }
//         }
//         stage("Deploy") {
//             steps {
//                 script {
//                     sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${env.BUILDIMG}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//                     sh "kubectl rollout status deployment/hello-kenzan"
//                 }
//             }
//         }
//     }
// }

// pipeline {
//     // agent any
//     // agent {
//     //     docker {
//     //         image 'docker:19.03.12'
//     //         args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
//     //     }
//     // }
//     agent {
//         docker {
//         image 'docker:20.10.7'
//         args '-v /var/run/docker.sock:/var/run/docker.sock'
//         }
//     }
//     environment {
//         // DOCKER_API_VERSION = "1.23"
//         DOCKER_API_VERSION = "1.3.0"
//         appName = "hello-kenzan"
//         registryHost = "127.0.0.1:30400/"
//     }
//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//                 sh "git rev-parse --short HEAD > commit-id"
//             }
//         }
//         stage("Build") {
//             steps {
//                 script {
//                     def tag = readFile('commit-id').trim()
//                     def imageName = "${registryHost}${appName}:${tag}"
//                     echo imageName 
//                     echo 'aaaaaaaaaaaaaaaaaaaaaaaaaa'
//                     env.BUILDIMG = imageName
//                     sh "docker build -f ${imageName} applications/hello-kenzan/Dockerfile applications/hello-kenzan"
//                 }
//             }
//         }
//         stage("Push") {
//             steps {
//                 script {
//                     sh "docker push ${env.BUILDIMG}"
//                 }
//             }
//         }
//         stage("Deploy") {
//             steps {
//                 script {
//                     sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${env.BUILDIMG}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//                     sh "kubectl rollout status deployment/hello-kenzan"
//                 }
//             }
//         }
//     }
// }

// node {

//     checkout scm

//     env.DOCKER_API_VERSION="1.23"
    
//     sh "git rev-parse --short HEAD > commit-id"

//     tag = readFile('commit-id').replace("\n", "").replace("\r", "")
//     appName = "hello-kenzan"
//     registryHost = "127.0.0.1:30400/"
//     imageName = "${registryHost}${appName}:${tag}"
//     env.BUILDIMG=imageName

//     stage "Build"
//         sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"

//     stage "Push"

//         sh "docker push ${imageName}"

//     stage "Deploy"

//         sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#'$BUILDIMG'#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//         sh "kubectl rollout status deployment/hello-kenzan"
// }

// pipeline {
//     agent any
//     environment {
//         DOCKER_API_VERSION = "1.23"
//         appName = "hello-kenzan"
//         registryHost = "127.0.0.1:30400/"
//     }
//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//                 sh "git rev-parse --short HEAD > commit-id"
//             }
//         }
//         stage("Build") {
//             steps {
//                 script {
//                     def tag = readFile('commit-id').trim()
//                     def imageName = "${registryHost}${appName}:${tag}"
//                     env.BUILDIMG = imageName
//                     sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"
//                 }
//             }
//         }
//         stage("Push") {
//             steps {
//                 script {
//                     sh "docker push ${env.BUILDIMG}"
//                 }
//             }
//         }
//         stage("Deploy") {
//             steps {
//                 script {
//                     sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${env.BUILDIMG}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//                     sh "kubectl rollout status deployment/hello-kenzan"
//                 }
//             }
//         }
//     }
// }



// pipeline {
//     agent any
//     environment {
//         DOCKER_API_VERSION = "1.23"
//     }
//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//                 sh "git rev-parse --short HEAD > commit-id"
//             }
//         }
//         stage("Build") {
//             steps {
//                 sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"
//                 // script {
//                 //     def tag = readFile('commit-id').trim()
//                 //     def appName = "hello-kenzan"
//                 //     def registryHost = "127.0.0.1:30400/"
//                 //     def imageName = "${registryHost}${appName}:${tag}"
//                 //     env.BUILDIMG = imageName
//                 //     sh "sudo apt-get update && sudo apt-get install -y docker.io && sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io && export PATH=$PATH:/usr/local/bin/docker && docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"
//                 // }
//             }
//         }
//         stage("Push") {
//             steps {
//                 script {
//                     sh "sudo apt-get update && sudo apt-get install -y docker.io && sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io && export PATH=$PATH:/usr/local/bin/docker && docker push ${env.BUILDIMG}"
//                 }
//             }
//         }
//         stage("Deploy") {
//             steps {
//                 script {
//                     sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${env.BUILDIMG}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//                     sh "kubectl rollout status deployment/hello-kenzan"
//                 }
//             }
//         }
//     }
// }

// pipeline {
//     agent any
//     environment {
//         DOCKER_API_VERSION = "1.23"
//     }
//     stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//                 sh "git rev-parse --short HEAD > commit-id"
//             }
//         }
//         stage("Build") {
//             steps {
//                 sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"
//             }
//         }
//         stage("Push") {
//             steps {
//                 script {
//                     sh "sudo apt-get update && sudo apt-get install -y docker.io && sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io && export PATH=$PATH:/usr/local/bin/docker && docker push ${imageName}"
//                 }
//             }
//         }
//         stage("Deploy") {
//             steps {
//                 sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#${imageName}#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
//                 sh "kubectl rollout status deployment/hello-kenzan"
//             }
//         }
//     }
// }


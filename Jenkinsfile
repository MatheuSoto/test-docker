pipeline {
    agent any

    environment {
        CONTAINER = "dockercontainer"
        IMAGE = "dockertest"
    }

    options {
        timeout(time: 2, unit: 'MINUTES')
    }

    stages {
        stage('Delete containers') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'docker rm -f ${env.CONTAINER} '
                }
            }
        }
        stage('Create image') {
            steps {
                sh 'docker build -t ${env.IMAGE} .'
            }
        }
        stage('Run tests') {
            steps {
                sh 'docker run ${env.IMAGE} npm test'
            }
        }
        stage('Start container') {
            steps {
                sh 'docker run --rm -d -p 3000:3000 ${env.CONTAINER}'
            }
        }
    }
}
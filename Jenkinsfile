pipeline {
    agent any

    environment {
        IMAGE = "dockerimage"
    }

    options {
        timeout(time: 2, unit: 'MINUTES')
    }

    stages {
        stage('Stop docker compose'){
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'docker-compose down'
                }
            }
        }
        stage('Create image') {
            steps {
                sh "docker build -t ${env.IMAGE} ."
            }
        }
        stage('Delete old images'){
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'docker image prune -a'
                }
            }
        }
        stage('Run tests') {
            steps {
                sh "docker run ${env.IMAGE} npm test"
            }
        }
        stage('Start docker compose') {
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}
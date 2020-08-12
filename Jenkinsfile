pipeline {
    agent any

    options {
        timeout(time: 2, unit: 'MINUTES')
    }

    stages {
        stage('Delete old container') {
            steps {
                sh 'docker rm -f $(docker ps -aq)'
            }
        }
        stage('Create container') {
            steps {
                sh 'docker build -t test .'
            }
        }
        stage('Start container') {
            steps {
                sh 'docker run --rm -p 3000:3000 test'
            }
        }
    }
}
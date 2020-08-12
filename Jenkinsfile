pipeline {
    agent any

    options {
        timeout(time: 2, unit: 'MINUTES')
    }

    stages {
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
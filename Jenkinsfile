pipeline {

    agent any

    stages {

        stage('Run MATLAB Tests') {
            steps {
                bat 'matlab -batch "runTests"'
            }
        }

        stage('Publish Results') {
            steps {
                junit 'results.xml'
            }
        }

    }

}
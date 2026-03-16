pipeline {

    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/madhav-h/matlab-cicd-project.git'
            }
        }

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
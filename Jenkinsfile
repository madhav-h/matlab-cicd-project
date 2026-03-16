pipeline {

    agent any

    stages {

        stage('Static Code Analysis') {
            steps {
                bat "matlab -batch \"checkcode(pwd)\""
            }
        }

        stage('Run MATLAB Tests') {
            steps {
                bat "matlab -batch \"runTests\""
            }
        }

        stage('Publish Test Results') {
            steps {
                junit 'results.xml'
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }

}
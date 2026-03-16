pipeline {

    agent any

    stages {

        stage('Run MATLAB CI Pipeline') {
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
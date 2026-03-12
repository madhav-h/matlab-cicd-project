pipeline {
    agent any

    stages {

        stage('Run MATLAB Test') {
            steps {
                bat """
                "C:\\Program Files\\MATLAB\\R2025b\\bin\\matlab.exe" -batch "disp('Running MATLAB test from Jenkins CI/CD')"
                """
            }
        }

    }
}

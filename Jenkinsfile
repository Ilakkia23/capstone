pipeline {
    agent any
    stages {
        stage('Build & Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}


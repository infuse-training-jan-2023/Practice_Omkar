pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                bat 'javac Code.java'
            }
        }
        stage('run') {
            steps {
                bat 'java Code'
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                bat 'javac code.java'
            }
        }
        stage('run') {
            steps {
                bat 'java code'
            }
        }
    }
}
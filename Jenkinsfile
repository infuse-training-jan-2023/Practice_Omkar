pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                echo env.STAGE_NAME
            }
        }
        stage('test') {
            steps {
                bat 'ruby Test_02.rb'
            }
        }
    }
}
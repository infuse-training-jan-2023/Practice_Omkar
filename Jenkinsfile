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
        stage('merge') {
            steps {
                bat '''
                    git switch jenkins/ruby
                    git pull
                    git switch jenkins/ruby-1
                    git pull
                    git switch jenkins/ruby
                    git merge --strategy-option theirs --no-edit jenkins/ruby-1
                    git push origin jenkins/ruby
                '''
            }
        }
    }
}
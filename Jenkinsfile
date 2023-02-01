pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                bat 'ruby test_unit.rb'
            }
        }
        stage('test') {
            steps {
                bat '''
                    git switch jenkins/ruby
                    git pull origin jenkins/ruby
                    git switch jenkins/ruby-1
                    git pull jenkins/ruby-1
                    git switch jenkins/ruby
                    git merge jenkins/ruby-1
                    git push origin jenkins/ruby
                '''
            }
        }
    }
}

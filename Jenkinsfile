pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        sh 'echo "hi1"'
        echo 'hi2'
        readFile '/var/log/dpkg.log'
      }
    }
    stage('stage2') {
      steps {
        sleep 5
      }
    }
    stage('Checkout') {
      steps {
        pwd(tmp: true)
      }
    }
    stage('End') {
      steps {
        cleanWs(cleanWhenSuccess: true)
      }
    }
  }
}
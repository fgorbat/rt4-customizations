pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        sh 'echo "hello world!"'
        echo 'my message'
        readFile '/var/log/dpkg.log'
      }
    }
    stage('stage2') {
      steps {
        sleep 5
      }
    }
  }
}
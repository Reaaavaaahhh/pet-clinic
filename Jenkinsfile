pipeline {
  	agent {
    kubernetes {
        inheritFrom 'docker'
    	}
  	}
    options {
		timestamps()
		ansiColor('xterm')
		// Save last 20 builds
		buildDiscarder(logRotator(numToKeepStr: '20'))
		// Disable Concurrent Builds
		disableConcurrentBuilds()
	}
    stages {
        stage ('Install Jira Service') {
            steps {
                 container('docker') {
                    retry(2) {
                        sh "docker run hello-world"
                }
          }
        }
    }

}
    post {
        always {
            cleanWs()
        }
    }
}

node("master") {
    stage('SCM Checkout'){
        git credentialsId: 'bc635477-1fa6-4ffa-8b38-2d68f72282e9', url: 'https://github.com/Reaaavaaahhh/pet-clinic.git' 
    }
    stage ('Mvn package'){
        def mvnHome = tool name: 'maven', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    stage ('move snapshot to dockerfile directory'){
        sh 'cp /var/lib/jenkins/workspace/jenkins-file_master/target/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar /var/lib/jenkins/workspace/jenkins-file_master'
    }
    stage('Build Docker Image'){
        sh 'docker build -t reaaavaaahhh/pet-clinic:2.3.3 .'
    }
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'docker_hub_password', variable: 'dockerHubcredentials')]) {
          sh "docker login -u reaaavaaahhh -p ${dockerHubcredentials}"
    } 
        sh 'docker push reaaavaaahhh/pet-clinic:2.3.3'
    }
    stage('Vagrant destroy'){
        sh 'sudo -H -u reaaavaaahhh bash -c cd /var/lib/jenkins/workspace/jenkins-file_master/ansible; vagrant destroy -f'
    }
    //stage('Docker image pull'){
    //    sh 'docker pull reaaavaaahhh/pet-clinic:2.3.3'
    //}
    //stage('Run Container on Dev Server'){
    //  def dockerRun = 'docker run -p 8080:8080 -d --name pet-clinic reaaavaaahhh/pet-clinic:2.3.3'
    //  sshagent(['eae5313a-df90-4833-9db4-cf694c1a8490']) {
    //    sh "ssh -o StrictHostKeyChecking=no vagrant@192.168.50.10 ${dockerRun}"
    // }
    //}
    stage('Run Vagrant'){
        sh 'sudo -H -u reaaavaaahhh bash -c cd /var/lib/jenkins/workspace/jenkins-file_master/ansible; vagrant up --provision'
    }
    stage('CleanWs'){
        always {
            cleanWs deleteDirs: true, notFailBuild: true
        }
    }    
}

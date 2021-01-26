#!groovy
node {
   
   echo 'Hello World'
}

node {
  
  def mvnHome = tool name: 'mvn', type: 'maven'

stage('Checkout the code'){
     
     git branch: 'master', credentialsId: '3c8f245a-9daf-4fb9-8059-f9fd0f7e8498', url: 'https://github.com/bobbiliraja/jenkins.git'
  }

stage('Build'){
     
     sh "${mvnHome}/bin/mvn clean package"
  
    }

stage('docker build'){
    
    sh 'docker rmi -f $(docker images -q) || true'
        
    sh 'docker build -t bobbiliraja/maven-web-application:t1 .'
        
    }

stage('docker push'){
    
    withCredentials([string(credentialsId: 'DOCKER_HUB_CRED', variable: 'DOCKER_HUB_CRED')]) {
    
    sh 'docker login -u bobbiliraja -p ${DOCKER_HUB_CRED}'
}
    
    sh 'docker push bobbiliraja/maven-web-application:t1'
    
stage ('build image in docker') {
    
    def dockerRun = 'docker run -d -p 8080:8080 --name raja bobbiliraja/maven-web-application:t1'
    
    sh 'docker image ls'
    
    sh 'docker rmi -f $(docker images -q) || true'
    
    sh 'docker stop raja'
    
    sh 'docker start raja || true'
    
    sh 'docker rm - $(docker ps -aq) || true'
    
    sh '${dockerRun} || true'
    
    sh 'docker container ps'
        
    }
        
    }        

}

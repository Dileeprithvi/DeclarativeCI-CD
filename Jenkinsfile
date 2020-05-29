def mvn
pipeline {
  agent { label 'master' }
    tools {
      maven 'Maven'
      jdk 'JAVA_HOME'
    }
  options { timestamps () }	
  environment {
    SONAR_HOME = "${tool name: 'sonar'}"
  }  
  stages {
   stage ('Maven Build') {
      steps {
        script {
          mvn= tool (name: 'Maven', type: 'maven') + '/bin/mvn'
        }
        sh "${mvn} clean install"
      }
    }
    stage('SonarQube_Analysis') {
      steps {
	    script {
          scannerHome = tool 'sonar'
        }
        withSonarQubeEnv('sonar_scanner') {
      	  sh """${scannerHome}/bin/sonar-scanner"""
        }
      }	
    }	

  }
}

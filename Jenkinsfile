def mvn
def server = Artifactory.server 'artifactory'
def rtMaven = Artifactory.newMavenBuild()
def buildInfo
pipeline {
  agent { label 'master' }
    tools {
      maven 'Maven'
      jdk 'JAVA_HOME'
    }
  options { timestamps () }	
  environment {
    SONAR_HOME = "${tool name: 'sonar-scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'}"
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
    stage('Artifactory_Configuration') {
      steps {
        script {
		  rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot', server: server
          rtBuildInfo ( captureEnv: true, )		
		  buildInfo = Artifactory.newBuildInfo()
        }			                      
      }
    }	
    stage('SonarQube_Analysis') {
      steps {
	    script {
          scannerHome = tool 'sonar-scanner'
        }
        withSonarQubeEnv('sonar') {
      	  sh """${scannerHome}/bin/sonar-scanner"""
        }
      }	
    }	
	stage('Quality_Gate') {
	  steps {
	    timeout(time: 1, unit: 'MINUTES') {
		  waitForQualityGate abortPipeline: true
        }
      }
    }
  }
}

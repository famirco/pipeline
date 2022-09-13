pipeline {
    agent any

    stages {
        stage('SSH Login') {
            steps {
                sh 'ssh -o StrictHostKeyChecking=no  root@192.168.100.100 echo Hi!'
            }
        }
        stage('Install K3s') {
             environment {
                 STATUS = sh(script: '''#!/usr/bin/bash
			            	ssh root@192.168.100.100 << ENDSSH
                            systemctl is-active k3s.service  
ENDSSH
''', returnStdout: true)
        }
            steps {
                    echo 'Using remote command over ssh'
                    sh (returnStdout: true, script: '''#!/usr/bin/bash
			            	ssh root@192.168.100.100 << ENDSSH
                            if [ ${STATUS} = "active" ]; then
                            echo "K3s is already installed.======${STATUS}"
                            else 
                            curl -sfL https://get.k3s.io | sh -
                            echo "Install k3s completly install.======${STATUS}"
                            fi
ENDSSH
'''.stripIndent())
            }
        }
        stage('Test K3s for running') {
            steps {
                    echo 'Using remote command over ssh'
                    sh (returnStdout: true, script: '''#!/usr/bin/bash
			            	ssh root@192.168.100.100 << ENDSSH
                            if [ ${STATUS} = "active" ]; then
                            echo "K3s is already installed.======${STATUS}"
                            else 
                            echo "K3s nasb nashod.======${STATUS}"                              
                            fi
ENDSSH
'''.stripIndent())
            }
        }
    }
}
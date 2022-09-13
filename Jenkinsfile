pipeline {
    agent any

    stages {
        stage('SSH Login') {
            steps {
                sh 'ssh -o StrictHostKeyChecking=no  root@192.168.100.100 echo Hi!'
            }
        }
        stage('Install K3s') {
            steps {
                    echo 'Using remote command over ssh'
                    sh (returnStdout: true, script: '''#!/usr/bin/bash
			            	ssh root@192.168.100.100 << ENDSSH
                            STATUS="$(systemctl is-active k3s.service)"
                            if [ -e systemctl is-active k3s.service = "active" ]; then
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
                            STATUS="$(systemctl is-active k3s.service)"
                            if [ -e -e systemctl is-active k3s.service = "active" ]; then
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
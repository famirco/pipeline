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
                script{
                    echo 'Using remote command over ssh'
                    sh '''ssh root@192.168.100.100 << ENDSSH
                            #!/usr/bin/bash
                            if [ "systemctl is-active k3s.service" = "active" ]; then
                                echo "K3s is already installed."
                            else 
                                curl -sfL https://get.k3s.io | sh -
                                echo "Install k3s completly install."
                            fi
ENDSSH
'''

                }
            }
        }
        stage('Test K3s for running') {
            steps {
                 script{
                    echo 'Using remote command over ssh'
                    sh '''ssh root@192.168.100.100 << ENDSSH
                            #!/usr/bin/bash
                            if [ "systemctl is-active k3s.service" = "active" ]; then
                                echo "K3s is already installed."
                            else 
                                echo "K3s nasb nashod."                              
                            fi
ENDSSH
'''
                }
            }
        }
    }
}
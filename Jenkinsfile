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
                    def remote = [:]
                    remote.name = 'DevOpsServer'
                    remote.host = '192.168.100.100'
                    remote.user = 'root'
                    remote.allowAnyHosts = true
                    stage('Remote SSH') {
                    sshPut remote: remote, from: 'InstallK3s.sh', into: '.'
                    sshScript remote: remote, script: "InstallK3s.sh"
                    }
        }
    }
}
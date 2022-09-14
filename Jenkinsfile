CODE_CHANGES = getGitChanges()
pipeline {
    agent any
    stages {
        stage('SSH Login') {
            when {
                expression {
                    BRANCH_NAME == 'Install-K3s' && Install-K3s == true
                }
            }
            steps {
                sh 'ssh -o StrictHostKeyChecking=no  root@192.168.100.100 echo Hi!'
            }
        }
        stage('Install K3s') {
            steps {
                script {
                    def remote = [:]
                    remote.name = 'DevOpsServer'
                    remote.host = '192.168.100.100'
                    remote.user = 'root'
                    remote.password = '1qaz!QAZ'
                    remote.allowAnyHosts = true
                    stage('Remote SSH') {
                    sshPut remote: remote, from: 'InstallK3s.sh', into: '.'
                    sshScript remote: remote, script: "InstallK3s.sh"
                    }
            
                }
            }
        }
    }
}

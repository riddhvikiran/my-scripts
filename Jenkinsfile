pipeline {
    agent any

    parameters {
        string(name: 'GIT_BRANCH', defaultValue: 'main', description: 'Git branch to pull')
        string(name: 'PLAYBOOK_FILE', defaultValue: 'check_cassandra.yml', description: 'Ansible playbook to run')
        string(name: 'CASS_USER', defaultValue: 'cassandra', description: 'Cassandra username')
        password(name: 'CASS_PASS', defaultValue: 'cassandra', description: 'Cassandra password')
        string(name: 'KEYSPACE', defaultValue: 'jenkins_lab', description: 'Keyspace to check')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: "${params.GIT_BRANCH}",
                    url: 'https://github.com/riddhvikiran/my-scripts.git',
                    credentialsId: 'github-pat'
            }
        }

        stage('List Repo Files') {
            steps {
                sh 'ls -l'
            }
        }

        stage('Run Cassandra Health Check') {
            steps {
                sh """
                /opt/homebrew/bin/ansible-playbook \
                  -i localhost, -c local \
                  ./${params.PLAYBOOK_FILE} \
                  --extra-vars "cass_user=${params.CASS_USER} cass_pass=${params.CASS_PASS} keyspace=${params.KEYSPACE}"
                """
            }
        }
    }
}


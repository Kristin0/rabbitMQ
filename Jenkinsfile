pipeline {
    environment { AWS_ACCESS_KEYS = credentials('ssh-aws-keys') }
    agent { label 'ec2-aws' }
    tools {
        terraform 'terraform'
    }
    
    stages {
        stage('Git checkout'){
            steps {
                git branch: 'main', credentialsId: 'github-token1', url: 'https://github.com/Kristin0/rabbitMQ.git'
            }
        }
        
        stage('Terraform'){
            steps {
                sh 'terraform init'
                sh 'terraform apply --auto-approve'
            }
        }
        
        stage('Ansible'){
            steps{
                ansiblePlaybook colorized: true, credentialsId: 'a4l.pem', disableHostKeyChecking: true, installation: 'ansible', inventory: 'inventory_aws_ec2.yml', playbook: 'rabbit_playbook.yml', vaultCredentialsId: '4ae90820-7767-4e1a-a163-eae6326a2150'
                }
        }
    }
}

pipeline {
    agent any
    

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the source code from the Git repository
                    git branch: 'main', credentialsId: 'git-credentails', url: 'https://github.com/mohanhundre1/Infraprovision-terraform.git'
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                script {
                    // Initialize Terraform
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentails', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        dir('Infraprovision-terraform/environments/dev') {
                        echo "Directory exists, proceeding with Terraform execution."
                    // Run your terraform commands here, e.g., terraform init, apply, etc.
                        pwd
                        sh 'terraform init'
                        sh 'terraform plan'
                        sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }

        /*stage('Terraform Plan') {
            steps {
                script {
                    dir('Infraprovision-terraform/environments/dev') {
                        echo "Directory exists, proceeding with Terraform execution."
                    // Run your terraform commands here, e.g., terraform init, apply, etc.
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    dir('Infraprovision-terraform/environments/dev') {
                        echo "Directory exists, proceeding with Terraform execution."
                    // Run your terraform commands here, e.g., terraform init, apply, etc.
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }*/
    }
}
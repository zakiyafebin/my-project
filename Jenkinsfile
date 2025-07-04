pipeline {

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID') // Use the credentials ID you set in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY') // Use the credentials ID you set in Jenkins
    }
    agent any
    tools {
        terraform 'terraform1' // Use the exact Name you configured above
    }

    stages {
        stage('Hello') {
            steps {
                echo 'my_app'
            }
        }
 
    
        stage('Clone Repo') {
            steps {
                // Clone the source code from the Git repository
                git url: 'https://github.com/zakiyafebin/my-project.git', branch: 'main' 
            }
        }

        stage('Verify Cloned Files') {
                steps {
                    sh 'ls -la'       // Check for 'docker' or 'Docker' - added -a for hidden files
                    sh 'ls -R'        // List contents of directories recursively
                    sh 'pwd'          // Print current working directory
                }
            }
            stage('Test Docker Access') {
            steps {
                // Verify that the Jenkins agent has the docker command available
                sh 'docker --version'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in the 'Docker' directory
                // -t tags the image, -f specifies the Dockerfile path, . is the build context
                // CORRECTED PATH based on the provided directory structure
                echo 'INSIDE DOCKER BUILD'
                sh 'pwd'
                sh 'ls /var/jenkins_home/workspace/'
                sh 'docker build -t cars-app  -f /var/jenkins_home/workspace/first-pipeline/my_app/Dockerfile .'
            }
        }
         stage('Save Docker Image') {
            steps {
                // Save the built Docker image as a tar archive
                // -o specifies the output file name
                sh 'docker save cars-app -o cars-app.tar'
            }
        }
        stage('Terraform Init & Apply') {
            steps {
                dir('terraform') {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
                }
            }
        }
}

    

    post {
        always {
            echo 'This will always run after the stages.'
        }
        success {
            echo 'This will run only if the pipeline is successful.'
        }
        failure {
            echo 'This will run only if the pipeline fails.'
        }
    }
}
   

pipeline {
    agent any

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
                sh 'docker build -t cars-app -f C:/Zakiya/Oeson/Local-Zak/my-proj/my_app/Dockerfile .'
            }
        }
         stage('Save Docker Image') {
            steps {
                // Save the built Docker image as a tar archive
                // -o specifies the output file name
                sh 'docker save cars-app -o cars-app.tar'
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
   

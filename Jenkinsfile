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
    }
    stage('Test Docker Access') {
            steps {
                // Verify that the Jenkins agent has the docker command available
                sh 'docker --version'
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
   

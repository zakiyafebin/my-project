git status
git add .
git add ../Jenkinsfile ../my_app/Dockerfile 
git add ./terraform/main.tf ./MyKeyPair.pem 
git commit -m "Update terraform and Docker configurations"
git push origin main
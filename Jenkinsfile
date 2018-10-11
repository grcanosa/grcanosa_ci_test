node('docker'){

  stage('greeting'){
     //prepare our slave container
     //sh "apt-get -qq update && apt-get -qq -y install maven python-dev libxml2-dev libxslt1-dev zlib1g-dev"
     //sh "pip3 install requests bs4 lxml"
     echo "grcanosa rulez!" 
  }

  stage('pre-req'){
    sh "docker ps -a"
  }

  stage('show-env'){
    sh "env"
  }

  stage('sleeping...'){
    sh "sleep 1"
  }

  stage('getting code'){
    git 'https://github.com/bootcampdatahack/grcanosa-ci'
  }

  stage("Checking python script"){
    sh "python helloworld.py"
  }

  stage("Building the docker image"){
    sh "docker build -t helloworld:0.0.1 ."
  }

  stage("Register image"){
    sh "docker push helloworld:0.0.1 jenkins01.datahack.edu:5000/grcanosa/helloworld:0.0.1"
  }
}
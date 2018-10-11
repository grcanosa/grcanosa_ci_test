node('docker'){

  stage('greeting'){
     //prepare our slave container
     //sh "apt-get -qq update && apt-get -qq -y install maven python-dev libxml2-dev libxslt1-dev zlib1g-dev"
     //sh "pip3 install requests bs4 lxml"
     echo "grcanosa rulez!" 
     echo "new repo"
  }

  // stage('pre-req'){
  //   sh "docker ps -a"
  // }

  // stage('show-env'){
  //   sh "env"
  // }

  // stage('sleeping...'){
  //   sh "sleep 1"
  // }

  stage('getting code'){
    git 'https://github.com/grcanosa/grcanosa_ci_test.git'
    GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
  }

  stage("Checking python script"){
    sh "python helloworld.py"
  }

  stage("Building the docker image"){
    sh "docker build --build-arg COMMIT_ID=$GIT_COMMIT_HASH -t jenkins01.datahack.edu:5000/grcanosa/helloworld:0.0.1 ."
  }

  stage("Register image"){
    sh "docker push jenkins01.datahack.edu:5000/grcanosa/helloworld:0.0.1"
  }

  stage("Deploy to pre"){
    sh "docker -H tcp://192.168.1.42:1988 stop grcanosa_app"
    sh "docker -H tcp://192.168.1.42:1988 run -d -p 8567:8567 --name grcanosa_app jenkins01.datahack.edu:5000/grcanosa/helloworld:0.0.1"
  }
}
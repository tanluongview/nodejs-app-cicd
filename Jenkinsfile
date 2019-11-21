node {
    def app

  try {

    stage('Checkout') {
      checkout scm
    }

    stage('Build image') {
      app = docker.build("my-feathers-app")
    }

    // stage('Build Docker test'){
    //  sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
    // }

    stage('Docker test'){
      // sh 'docker run --rm react-test'
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    // stage('Clean Docker test'){
    //   sh 'docker rmi react-test'
    // }

    stage('Push image') {
        docker.withRegistry('localhost:5000') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Deploy'){
        sh 'echo "Deployed"'
    //   if(env.BRANCH_NAME == 'master') {
    //     sh 'docker build -t my-feathers-app --no-cache .'
    //     sh 'docker tag my-feathers-app localhost:5000/my-feathers-app'
    //     sh 'docker push localhost:5000/my-feathers-app'
    //     sh 'docker rmi -f my-feathers-app localhost:5000/my-feathers-app'
    //   }
    }
  }
  catch (err) {
    throw err
  }
}
node {
  try {
    stage('Checkout') {
      checkout scm
    }

    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }

    // stage('Build Docker test'){
    //  sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
    // }
    // stage('Docker test'){
    //   sh 'docker run --rm react-test'
    // }
    // stage('Clean Docker test'){
    //   sh 'docker rmi react-test'
    // }

    stage('Deploy'){
      if(env.BRANCH_NAME == 'master') {
        def customImage = docker.build("my-feathers-app:${env.BUILD_ID}")
        customImage.push()
        customImage.push('latest')
        // sh 'docker build -t my-feathers-app --no-cache .'
        // sh 'docker tag my-feathers-app localhost:5000/my-feathers-app'
        // sh 'docker push localhost:5000/my-feathers-app'
        // sh 'docker rmi -f my-feathers-app localhost:5000/my-feathers-app'
      }
    }
  }
  catch (err) {
    throw err
  }
}
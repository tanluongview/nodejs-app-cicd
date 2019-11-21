node {
    checkout scm

    def customImage = docker.build("my-feathers-app:${env.BUILD_ID}")
    customImage.push()
    customImage.push('latest')
}
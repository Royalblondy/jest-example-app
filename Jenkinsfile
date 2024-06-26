pipeline {
    agent any

    environment{
        DOCKERHUB_CREDENTIALS = credentials('DockerHub')
        IMAGE_NAME = "jestapp:v1.${env.BUILD_NUMBER}"
    }

    triggers {
        pollSCM('*/2 * * * *')
    }


    stages {
        stage('Prepare Environment') {
            steps {
                sh '''
                cd ./Dockerfiles
                chmod +x shutdown.sh
                ./shutdown.sh
                '''
            }
        }
        stage('Build and Test') {
            steps {
                echo "Building and testing..."
                sh '''
                cd ./Dockerfiles
                docker-compose build --no-cache
                docker-compose up --exit-code-from test_app
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying ..."
                sh '''
                cd ./Dockerfiles
                docker build --no-cache -t $IMAGE_NAME -f deploy.Dockerfile .
                docker run -d -p 41247:3000 --name deploy-container $IMAGE_NAME
                '''
            }
        }
        stage('Archive') {
            steps {
                echo 'Archiving build output and test logs...'
                sh '''
                mkdir -p artifact 
		        cd ./artifact     
                docker logs build-container > build-logs.log
                docker logs test-container > test-logs.log
		        docker compose -f ../Dockerfiles/docker-compose.yaml down
                docker cp deploy-container:server/build .
                cd ..
                tar -czf archive.tar.gz artifact/
                '''
                archiveArtifacts(artifacts: 'archive.tar.gz', onlyIfSuccessful: true)
            }
        }
        stage('Publish') {
            steps {
                echo "Publishing version number v1.${env.BUILD_NUMBER}"
                
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker tag $IMAGE_NAME royalblondy/$IMAGE_NAME"
                sh "docker tag $IMAGE_NAME royalblondy/jestapp:latest"
                sh "docker push royalblondy/$IMAGE_NAME"
                sh "docker push royalblondy/jestapp:latest"
                sh "docker rmi royalblondy/jestapp:latest royalblondy/$IMAGE_NAME"
                
            }
        }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
}

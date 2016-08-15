# Jenkins with Android SDK in Docker

* Build
 * download Dockerfile
 * docker build .

* Usage
 * sudo docker run -d -p 8080:8080 -p 50000:50000 --name YOUR_JENKINS_NAME docker-jenkins-android
 * configure jenkins as you need
 * if use AWS Device Farm, plz refer to http://docs.aws.amazon.com/devicefarm/latest/developerguide/continuous-integration-jenkins-plugin.html


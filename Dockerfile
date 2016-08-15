FROM jenkins:latest

USER root

# Environment Vars
ENV ANDROID_SDK_VERSION=r24.4.1

# Android And Other Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git expect lib32stdc++6 lib32z1 && apt-get clean; \

# Download And Extract Android SDK
cd /opt && curl -O http://dl.google.com/android/android-sdk_${ANDROID_SDK_VERSION}-linux.tgz; cd /opt && tar xzf android-sdk_${ANDROID_SDK_VERSION}-linux.tgz; cd /opt && rm -f android-sdk_${ANDROID_SDK_VERSION}-linux.tgz; chmod -R +xr /opt/android-sdk-linux; chown -R jenkins:jenkins /opt/android-sdk-linux

USER jenkins

# Android SDK volumes so it doesn't get wiped on image updates
VOLUME ["/opt/android-sdk-linux"]

# Android SDK Paths
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

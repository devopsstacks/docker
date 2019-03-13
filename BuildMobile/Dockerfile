# Base Image
FROM node:9-stretch
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install wget
RUN wget -O /tmp/android-studio-ide-182.5314842-linux.zip https://dl.google.com/dl/android/studio/ide-zips/3.3.2.0/android-studio-ide-182.5314842-linux.zip
RUN unzip /tmp/android-studio-ide-182.5314842-linux.zip -d /opt && rm -f /tmp/android-studio-ide-182.5314842-linux.zip
ENTRYPOINT ["/bin/bash"]
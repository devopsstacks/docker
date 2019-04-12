# Base Image
FROM node:9-stretch

RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common

# Install Build Essentials
RUN apt-get update -y && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y php && apt-get install -y ant
# Install Composer
RUN cd ~ && curl -sS https://getcomposer.org/installer -o composer-setup.php
ENTRYPOINT ["/bin/bash"]

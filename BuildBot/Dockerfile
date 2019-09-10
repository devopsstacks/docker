# Base Image
FROM node:8-stretch

RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common

# Install Build Essentials
RUN apt-get update -y && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y php && apt-get install -y ant
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
# Install Dependets plugin pm
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox && curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.profile && nvm install v8.9.4 && npm install -g gulp
ENTRYPOINT ["/bin/bash"]

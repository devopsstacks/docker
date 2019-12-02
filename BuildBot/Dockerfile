# Base Image
FROM node:8.9-stretch

RUN cat /etc/os-release
RUN node -v
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common
#RUN apt-get -y install php7.1
# Install Build Essentials
#RUN apt-get update
RUN apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y php && apt-get install -y ant
RUN echo '***********************' && php -v && echo '***********************'
RUN apt-get install -y php7.1 
RUN update-alternatives --set php /usr/bin/php7.1# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
# Install Dependets plugin pm
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox 
RUN npm install -g gulp
ENTRYPOINT ["/bin/bash"]

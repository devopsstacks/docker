# Base Image
FROM node:8.9-stretch

RUN cat /etc/os-release
RUN echo '*************' && node -v && echo '*******************'
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common
RUN apt-get install -y ca-certificates apt-transport-https
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y
RUN apt-get install php7.1 -y
RUN apt-get install php7.1-mbstring
# Install Build Essentials
#RUN apt-get update
RUN apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y php && apt-get install -y ant
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox 
RUN npm install -g gulp
RUN echo '-----------' php -v echo '----------------'
ENTRYPOINT ["/bin/bash"]

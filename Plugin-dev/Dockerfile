FROM debian:stretch

RUN cat /etc/os-release
RUN apt-get update -y
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common
RUN apt-get update -y && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y php && apt-get install -y ant
#Install CURL
RUN apt-get install curl -y
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
# Install Dependets plugin pm
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox
RUN php -v
# Install node Versions
#RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.profile && nvm install v8.9.4 && nvm use v8.9.4
RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh && bash install_nvm.sh && source ~/.profile && nvm install 8.9.4 && nvm use 8.9.4
RUN node -v
ENTRYPOINT ["/bin/bash"]

# Base Image
FROM debian:stretch-slim
# Install Build Essentials
RUN apt-get -y install jq && apt-get install -y php && apt-get install -y ant
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
# Remove default node
RUN apt-get remove node* -y
# Install node with NVM
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.profile && nvm install v8.9.4
# Install Dependets plugin pm
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox && npm install -g gulp
ENTRYPOINT ["/bin/bash"]

# Base Image
FROM debian:10

RUN cat /etc/os-release
#RUN node -v
RUN apt-get update -y
RUN apt install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https
RUN wget https://packages.sury.org/php/apt.gpg
RUN apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list
RUN apt update -y
RUN apt-get install -y php7.2
RUN apt-get install -y php7.1
RUN update-alternatives --set php /usr/bin/php7.1
RUN apt-get -y install unzip && apt-get -y install software-properties-common
RUN apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y && apt-get -y install jq && apt-get -y install jq awscli && apt-get install -y ant
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
# Install Dependets plugin pm
RUN apt-get install -y phploc && apt-get install -y php-codesniffer && apt-get install -y phpmd && apt-get install -y pdepend && apt-get install -y phpunit && apt-get install -y phpdox 
RUN npm install -g gulp
RUN php -v
ENTRYPOINT ["/bin/bash"]

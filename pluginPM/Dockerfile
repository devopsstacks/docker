# Base Image
FROM amazonlinux:2017.09
RUN cat /etc/os-release
RUN node -v
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common
RUN yum install -y php70-gd
RUN yum install -y php72-gd
RUN yum install -y php71-gd

RUN update-alternatives --set php /usr/bin/php7.1# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

ENTRYPOINT ["/bin/bash"]


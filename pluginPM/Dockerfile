# Base Image
FROM amazonlinux:2017.09
RUN cat /etc/os-release
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs
RUN node -v
RUN yum update -y && yum -y install unzip
# Install Build Essentials
#RUN apt-get update
RUN yum install -y build-essential && yum install -y file && yum install -y jq && yum install -y awscli && yum install -y ant
RUN echo '**********************************************'
RUN yum install -y php70-gd
RUN yum install -y php72-gd
RUN yum install -y php71-gd

RUN update-alternatives --set php /usr/bin/php7.1# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

ENTRYPOINT ["/bin/bash"]


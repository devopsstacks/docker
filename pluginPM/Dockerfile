# Base Image
FROM amazonlinux:2017.09
RUN cat /etc/os-release
RUN node -v
RUN apt-get update -y && apt-get -y install unzip && apt-get -y install software-properties-common
RUN yum install -y php70-gd php70-mysqlnd php70-soap php70-mbstring php70-ldap php70-mcrypt php70-xml php70-imap 
RUN yum install -y php72-gd php72-mysqlnd php72-soap php72-mbstring php72-ldap php72-mcrypt php72-xml php72-imap 
RUN yum install -y php71-gd php56-mysqlnd php56-soap php56-mbstring php56-ldap php56-mcrypt php56-xml php56-imap

RUN update-alternatives --set php /usr/bin/php7.1# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

ENTRYPOINT ["/bin/bash"]


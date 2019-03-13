#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install epel-release sendmail wget -y  ;
  touch /etc/sysconfig/network ;
  
  cp /etc/hosts ~/hosts.new ;
  sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
  cp -f ~/hosts.new /etc/hosts ;

##### install nginx & php & mysql-client #####

  yum -y remove httpd* ;
  yum -y install nginx ;
  yum -y install php71-fpm  php71-gd php71-mysqlnd php71-soap php71-mbstring php71-ldap php71-mcrypt php71-xml php71-opcache ;
  yum -y install mysql56 ;

## configure php.ini ##
  sed -i '/short_open_tag = Off/c\short_open_tag = On' /etc/php.ini ;
  sed -i '/post_max_size = 8M/c\post_max_size = 24M' /etc/php.ini ;
  sed -i '/upload_max_filesize = 2M/c\upload_max_filesize = 24M' /etc/php.ini ;
  sed -i '/;date.timezone =/c\date.timezone = America/New_York' /etc/php.ini ;
  sed -i '/expose_php = On/c\expose_php = Off' /etc/php.ini ;
  sed -i '/memory_limit = 128M/c\memory_limit = 512M' /etc/php.ini ;

## install opcache ##
  sed -i '/opcache.max_accelerated_files=4000/c\opcache.max_accelerated_files=10000' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.max_wasted_percentage=5/c\opcache.max_wasted_percentage=5' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.use_cwd=1/c\opcache.use_cwd=1' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.validate_timestamps=1/c\opcache.validate_timestamps=1' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.fast_shutdown=0/c\opcache.fast_shutdown=1' /etc/php.d/10-opcache.ini ;

## composer ##
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

## composer ##
  yum -y install yum-utils ;
  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm ;
  yum -y  install redis ;

## NodeJS ##
  wget https://rpm.nodesource.com/setup_10.x ;
  bash setup_10.x ;
  yum -y install nodejs ;

## Supervisor ##
  
  yum -y install supervisor ;
  

##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
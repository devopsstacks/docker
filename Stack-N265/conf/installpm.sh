#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install epel-release mod_ssl sendmail wget -y  ;
  touch /etc/sysconfig/network ;
  
  cp /etc/hosts ~/hosts.new ;
  sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
  cp -f ~/hosts.new /etc/hosts ;

##### install nginx & php & mysql-client #####

  yum -y remove httpd* ;
  yum -y install nginx ;
  yum -y install php73-fpm  php73-gd php73-mysqlnd php73-soap php73-mbstring php73-ldap php73-mcrypt php73-xml php73-opcache php73-imap ;
  yum -y install mysql57 ;

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

## supervisor ##
  yum install python36-pip -y ;
  easy_install-3.6 supervisor ;
  mkdir /etc/supervisor ;
  echo_supervisord_conf > /etc/supervisor/supervisord.conf ;
  sed -i '/;\[include\]/c\\[include\]' /etc/supervisor/supervisord.conf ;
  sed -i '/;files = relative\/directory\/\*.ini/c\files = \/etc\/supervisor\/processmaker\*' /etc/supervisor/supervisord.conf ;
  
##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install epel-release mod_ssl sendmail wget -y  ;
  touch /etc/sysconfig/network ;
  
  cp /etc/hosts ~/hosts.new ;
  sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
  cp -f ~/hosts.new /etc/hosts ;

##### install Apache & php & mysql-client#####
  yum -y remove httpd* ;
  yum -y install httpd24 php55;
  yum -y install php55-fpm  php55-gd php55-mysqlnd php55-soap php55-mbstring php55-ldap php55-mcrypt php55-xml php55-opcache ;
  yum -y install mysql55 ;


##### configure php.ini #####
  sed -i '/short_open_tag = Off/c\short_open_tag = On' /etc/php.ini ;
  sed -i '/post_max_size = 8M/c\post_max_size = 24M' /etc/php.ini ;
  sed -i '/upload_max_filesize = 2M/c\upload_max_filesize = 24M' /etc/php.ini ;
  sed -i '/;date.timezone =/c\date.timezone = America/New_York' /etc/php.ini ;
  sed -i '/expose_php = On/c\expose_php = Off' /etc/php.ini ;
  sed -i '/memory_limit = 128M/c\memory_limit = 512M' /etc/php.ini ;

##### configura Apache #####
  sed -i 's@#LoadModule expires_module modules/mod_expires.so@LoadModule expires_module modules/mod_expires.so@' /etc/httpd/conf/httpd.conf ;
  sed -i 's@#LoadModule rewrite_module modules/mod_rewrite.so@LoadModule rewrite_module modules/mod_rewrite.so@' /etc/httpd/conf/httpd.conf ;
  sed -i 's@#LoadModule deflate_module modules/mod_deflate.so@LoadModule deflate_module modules/mod_deflate.so@' /etc/httpd/conf/httpd.conf ;
  sed -i 's@#LoadModule vhost_alias_module modules/mod_vhost_alias.so@LoadModule vhost_alias_module modules/mod_vhost_alias.so@' /etc/httpd/conf/httpd.conf ;
  sed -i 's@#LoadModule filter_module modules/mod_filter.so@LoadModule filter_module modules/mod_filter.so@' /etc/httpd/conf/httpd.conf ;
  echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf ;

##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
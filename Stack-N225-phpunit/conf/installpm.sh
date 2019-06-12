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
  yum -y install php71-fpm  php71-gd php71-mysqlnd php71-soap php71-mbstring php71-ldap php71-mcrypt php71-xml php71-opcache ;
  yum -y install mysql56 ;

## configure php.ini ##
  sed -i '/short_open_tag = Off/c\short_open_tag = On' /etc/php.ini ;
  sed -i '/post_max_size = 8M/c\post_max_size = 24M' /etc/php.ini ;
  sed -i '/upload_max_filesize = 2M/c\upload_max_filesize = 24M' /etc/php.ini ;
  sed -i '/;date.timezone =/c\date.timezone = America/New_York' /etc/php.ini ;
  sed -i '/expose_php = On/c\expose_php = Off' /etc/php.ini ;
  sed -i '/memory_limit = 128M/c\memory_limit = 1024M' /etc/php.ini ;

## install opcache ##
  sed -i '/opcache.max_accelerated_files=4000/c\opcache.max_accelerated_files=10000' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.max_wasted_percentage=5/c\opcache.max_wasted_percentage=5' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.use_cwd=1/c\opcache.use_cwd=1' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.validate_timestamps=1/c\opcache.validate_timestamps=1' /etc/php.d/10-opcache.ini ;
  sed -i '/;opcache.fast_shutdown=0/c\opcache.fast_shutdown=1' /etc/php.d/10-opcache.ini ;

## install mysql
  yum install -y mysql56-server ;
  service mysqld start ;
  mysql -e "UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='root';" ;
  mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" ; 
  mysql -e "DELETE FROM mysql.user WHERE User='';" ;
  mysql -e "FLUSH PRIVILEGES;" ;
  echo "[mysqld]
max_allowed_packet=100M" >> /etc/my.cnf ;

## install git
 yum install -y git ;
 
## install composer 
 curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer ;

## install Xdebug
 yum install -y php71-xdebug ;
 echo "[xdebug]
zend_extension=/usr/lib64/php/7.1/modules/xdebug.so
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9000" >> /etc/php.ini ;

##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
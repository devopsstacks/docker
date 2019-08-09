#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install epel-release sendmail wget unzip -y  ;
  touch /etc/sysconfig/network ;
  
  cp /etc/hosts ~/hosts.new ;
  sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
  cp -f ~/hosts.new /etc/hosts ;

##### install nginx & php #####

  yum -y remove httpd* ;
  yum -y install nginx ;
  yum -y install php72-fpm php72-gd php72-mysqlnd php72-soap php72-mbstring php72-ldap php72-mcrypt php72-xml php72-opcache php72-cli ;
  yum -y install php72-curl php72-zip php72-json;
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

## composer ##
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

## Redis ##
  yum -y install gcc make ;
  wget http://download.redis.io/releases/redis-3.2.0.tar.gz ;
  tar xzf redis-3.2.0.tar.gz ;
  rm -f redis-3.2.0.tar.gz ;

  cd redis-3.2.0 ;
  make distclean ;
  make ;

  mkdir -p /etc/redis /var/lib/redis /var/redis/6379 ;
  cp src/redis-server src/redis-cli /usr/local/bin ;
  cp redis.conf /etc/redis/redis.conf ;

  sed -i '/daemonize no/c\daemonize yes' /etc/redis/redis.conf ;
  sed -i '/dir .\//c\dir \/var\/redis\/6379' /etc/redis/redis.conf ;

  wget https://raw.githubusercontent.com/saxenap/install-redis-amazon-linux-centos/master/redis-server ;
  mv redis-server /etc/init.d ;
  chmod 755 /etc/init.d/redis-server ;


## NodeJS ##
  wget https://rpm.nodesource.com/setup_10.x ;
  sh setup_10.x ;
  yum -y install nodejs ; 

## supervisor ##
  yum install python36-pip -y ;
  easy_install-3.6 supervisor ;
  mkdir /etc/supervisor ;
  echo_supervisord_conf > /etc/supervisor/supervisord.conf ;
  sed -i '/;\[include\]/c\\[include\]' /etc/supervisor/supervisord.conf ;
  sed -i '/;files = relative\/directory\/\*.ini/c\files = \/etc\/supervisor\/processmaker\*' /etc/supervisor/supervisord.conf ;

## development tools ##
  yum install -y jq ;
  yum install -y git ;
  yum install -y gcc-c++ ;
  yum install -y aws-cli ;

## pdo_sqlsrv ##
  curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo ;          
  yum remove -y unixODBC* ;
  yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-11.el7.x86_64.rpm ;
  yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-devel-2.3.1-11.el7.x86_64.rpm ;
  yum install -y gcc-c++ gcc php72-devel ;
  yum install -y php72-odbc ;
  yum install -y php7-pear ;
  ACCEPT_EULA=Y yum install -y msodbcsql ;
  pecl7 install sqlsrv ;
  pecl7 install pdo_sqlsrv ;
  echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini ;
  echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20-sqlsrv.ini ;
  
## docker ##
  yum install -y docker ;
  
##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all ;

###############################################################################################################
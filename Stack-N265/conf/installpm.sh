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
  yum -y install php73-cli php73-fpm  php73-gd php73-mysqlnd php73-soap php73-mbstring php73-ldap php73-mcrypt php73-xml php73-opcache php73-imap php73-devel ;
  yum install -y gcc make autoconf ;
  yum install -y libmcrypt libmcrypt-devel ;
  yum install -y php7-pear ;
  printf "\n" | pecl7 install --nodeps mcrypt-snapshot ;
  echo extension=/usr/lib64/php/7.3/modules/mcrypt.so >> /etc/php.ini ;
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
  sed -i '/;files = relative\/directory\/\*.ini/c\files = \/etc\/supervisor\/processmaker\*.ini' /etc/supervisor/supervisord.conf ;

#Integrations

#v"PostgreSQL connection" ;
yum install -y php73-pgsql ;

#"MSSQL connection" ;
curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo ;

yum remove -y unixODBC* ;
yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-14.el7.x86_64.rpm ;
yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-devel-2.3.1-14.el7.x86_64.rpm ;

yum install -y gcc-c++ gcc php73-devel ;
yum install -y php73-odbc ;
yum install -y php7-pear ;
ACCEPT_EULA=Y yum install -y msodbcsql ;
pecl7 install sqlsrv ;
pecl7 install pdo_sqlsrv ;
echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini ;
echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20-sqlsrv.ini ;
#"ODBC connection " ;
yum install -y unixODBC unixODBC-devel php73-odbc ;

#"Oracle connection " ;

yum install -y php73-devel php73-pecl-apcu gcc libaio php7-pear ;
cd /tmp ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-10.2-basic.tar.gz ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-10.2-devel.tar.gz ;
rpm -Uvh /tmp/oracle-10.2-basic.tar.gz ;
rpm -Uvh /tmp/oracle-10.2-devel.tar.gz ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-11.2-basic.tar.gz ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-11.2-devel.tar.gz ;
rpm -Uvh /tmp/oracle-11.2-basic.tar.gz ;
rpm -Uvh /tmp/oracle-11.2-devel.tar.gz ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-12.2-basic.tar.gz ;
wget https://artifacts.processmaker.net/dbintegrations/oracle-12.2-devel.tar.gz ;
rpm -Uvh /tmp/oracle-12.2-basic.tar.gz ;
rpm -Uvh /tmp/oracle-12.2-devel.tar.gz ;

printf "\n" | pecl7 install oci8-2.2.0 ;
echo "extension=oci8.so" >> /etc/php.ini ;

##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
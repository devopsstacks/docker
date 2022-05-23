#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install mod_ssl sendmail wget -y  ;
  yum install -y /usr/bin/systemctl; systemctl --version ;
  yum install unzip -y

##### install nginx & php & mysql-client #####

  yum -y remove httpd* ;
  amazon-linux-extras enable nginx1 -y ;
  yum -y install nginx ;
  
  wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
  rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
  yum install yum-utils -y
  yum-config-manager --enable remi-php74
  yum -y install php74-php-cli php74-php-fpm  php74-php-gd php74-php-mysqlnd php74-php-soap php74-php-mbstring php74-php-ldap php74-php-mcrypt php74-php-xml php74-php-opcache php74-php-imap php74-php-devel ;
  yum -y install php74-php-pear php74-php-pgsql php74-php-odbc php74-php-pecl-apcu php74-php-zip ;
  mv /etc/yum.repos.d/amzn2-core.repo /etc/ ;
  yum -y install php-cli php-fpm  php-gd php-mysqlnd php-soap php-mbstring php-ldap php-mcrypt php-xml php-opcache php-imap php-devel ;
  yum -y install php-pear php-pgsql php-odbc php-pecl-apcu php-zip ;
  mv /etc/amzn2-core.repo /etc/yum.repos.d/
  
  yum localinstall -y https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
  yum install -y mysql-community-client

  mkdir /run/php-fpm/ ;
  

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
  yum install supervisor -y ;

#Integrations

#"MSSQL connection" ;
curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo ;

yum remove -y unixODBC* ;
yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-14.el7.x86_64.rpm ;
yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-devel-2.3.1-14.el7.x86_64.rpm ;

yum install -y gcc-c++ gcc ;
ACCEPT_EULA=Y yum install -y msodbcsql ;
pecl install sqlsrv ;
pecl install pdo_sqlsrv ;
echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini ;
echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20-sqlsrv.ini ;
#"ODBC connection " ;
yum install -y unixODBC unixODBC-devel 
mv /etc/yum.repos.d/amzn2-core.repo /etc/
yum install -y php-odbc ;
mv /etc/amzn2-core.repo /etc/yum.repos.d/

#"Oracle connection " ;

yum install -y php-pecl-apcu gcc libaio;
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
yum install -y systemtap-sdt-devel ;
export PHP_DTRACE=yes ;
printf "\n" | pecl install oci8-2.2.0 ;
echo "extension=oci8.so" >> /etc/php.ini ;

#### extras ####

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum update -y
yum install -y mysql-community-client
yum install -y git
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer ;
yum install -y php-pecl-xdebug
 echo "[xdebug]
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9000" >> /etc/php.ini

##### clean #####
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################

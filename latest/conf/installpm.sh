#!/bin/bash

##### install tools #####
  yum clean all && yum update -y && yum install epel-release mod_ssl sendmail wget -y  ;
  touch /etc/sysconfig/network ;
  
  cp /etc/hosts ~/hosts.new ;
  sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
  cp -f ~/hosts.new /etc/hosts ;

##### install nginx & php & mysql-client#####

  yum -y install nginx;
  yum -y install php56-fpm  php56-gd php56-mysqlnd php56-soap php56-mbstring php56-ldap php56-mcrypt php56-xml php56-opcache ;
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

##### install processmaker 3.2.2 #####
  cd /tmp/ && wget https://artifacts.processmaker.net/official/processmaker-3.2.2+001.tar.gz ;
  tar -C /opt -xzvf processmaker-3.2.2+001.tar.gz ;
  cd /opt/processmaker/ ;
  chmod -R 770 shared workflow/public_html gulliver/js thirdparty/html2ps_pdf/cache ;
  cd /opt/processmaker/workflow/engine/ ;
  chmod -R 770 config content/languages plugins xmlform js/labels ;
  chown -R nginx:nginx /opt/processmaker ;

##### clean #####
  rm -rf /tmp/processmaker-3.2.2+001.tar.gz ;
  yum clean packages ;
  yum clean headers ;
  yum clean metadata ;
  yum clean all

###############################################################################################################
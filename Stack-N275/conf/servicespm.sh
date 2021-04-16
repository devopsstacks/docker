#!/bin/bash
set -e ;

/usr/sbin/sendmail </dev/null 1 >/dev/null 2>log.txt & 
php-fpm

if [ -d /opt/processmaker/workflow/engine ];
then
    echo "ProccessMaker is already installed";
else
    /bin/sh /tmp/pmoptional.sh ;
fi

echo "
       ░░░░░░░
    ░░░░░░░░░░░░░
   ░░░░       ░░░░     WELCOME TO PROCESSMAKER STACK N275 -> ( amazonlinux:2017.09 ; NGINX-1.12 ; PHP-7.3 )
  ░░░░  ░░░░░   ░░░
  ░░░  ░░░░░░░  ░░░░   - This ProcessMaker Stack uses MySql 8
  ░░░  ░░░░░░   ░░░    - The following command runs mysql8 in Docker:
   ░░  ░░     ░░░░     -> docker run --name pm-db8 -e MYSQL_ROOT_PASSWORD=PM-Testdb -p 3306:3306 -d mysql:8 mysqld --default-authentication-plugin=mysql_native_password
    ░  ░░░░░░░░░       
       ░░░░░░░         For more information see https://www.processmaker.com
                                                http://wiki.processmaker.com/3.2/Supported_Stacks
	 " ; 
sleep 3 ;
pkill php-fpm ;
php-fpm 
if [ -d "/opt/processmaker/workflow/engine" ] ; then /usr/bin/supervisord -c /etc/supervisord.conf && /usr/bin/supervisorctl reload ; fi
pkill nginx ;
nginx -g 'daemon off;' ;
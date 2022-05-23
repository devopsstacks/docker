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
   ░░░░       ░░░░     WELCOME TO PROCESSMAKER STACK N285 -> ( amazonlinux ; NGINX ; PHP-8.1 )
  ░░░░  ░░░░░   ░░░
  ░░░  ░░░░░░░  ░░░░   - This ProcessMaker Stack uses MySql 8
  ░░░  ░░░░░░   ░░░    - The following command runs mysql8 in Docker:
   ░░  ░░     ░░░░     -> docker run --name pm-db8 -e MYSQL_ROOT_PASSWORD=PM-Testdb -p 3306:3306 -d mysql:8 mysqld --default-authentication-plugin='mysql_native_password' --optimizer-switch='derived_merge=off' --sql-mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
    ░  ░░░░░░░░░       
       ░░░░░░░         For more information see https://www.processmaker.com
                                                http://wiki.processmaker.com/3.7/Supported_Stacks
	 " ; 
sleep 3 ;
pkill php-fpm ;
echo "step 1";
php-fpm 
echo "step 2";
if [ -d "/opt/processmaker/workflow/engine" ] ; then /usr/bin/supervisord -c /etc/supervisord.conf && /usr/bin/supervisorctl reload ; fi
echo "step 3";
if [ -f "/var/run/nginx.pid" ] ; then pkill nginx; fi
echo "step 4";
nginx -g 'daemon off;' ;
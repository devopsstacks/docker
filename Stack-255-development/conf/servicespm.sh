#!/bin/bash
set -e ;

cp /etc/hosts ~/hosts.new ;
sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
cp -f ~/hosts.new /etc/hosts ;

service sendmail start ;

if [ -d /opt/processmaker/workflow/engine ];
then
    echo "ProccessMaker is already installed" ;
else
    /bin/sh /tmp/pmoptional.sh ;
fi
/bin/sh /tmp/integrations.sh ;

echo "
       ░░░░░░░
    ░░░░░░░░░░░░░
   ░░░░       ░░░░     WELCOME TO PROCESSMAKER STACK 255 -> ( amazonlinux:2017.09 ; APACHE-2.4 ; PHP-7.1 )
  ░░░░  ░░░░░   ░░░
  ░░░  ░░░░░░░  ░░░░   - This ProcessMaker Stack uses MySql 5.7
  ░░░  ░░░░░░   ░░░    - The following command runs mysql57 in Docker:
   ░░  ░░     ░░░░     -> docker run --name pm-db56 -e MYSQL_ROOT_PASSWORD=PM-Testdb -p 3306:3306 -d mysql:5.7
    ░  ░░░░░░░░░       
       ░░░░░░░         For more information see https://www.processmaker.com
                                                http://wiki.processmaker.com/3.2/Supported_Stacks
	 " ; 
rm -f /usr/local/apache2/logs/httpd.pid ;

httpd -DFOREGROUND ;
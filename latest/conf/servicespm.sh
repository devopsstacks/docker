#!/bin/bash
set -e ;

cp /etc/hosts ~/hosts.new ;
sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
cp -f ~/hosts.new /etc/hosts ;

service sendmail start ;
service php-fpm start ;

if [ -d /opt/processmaker/workflow/engine ];
then
    echo "ProccessMaker is already installed";
else
    if [[ -z "${PM_URL}" ]];
    then
        echo "ProcessMaker is being installed this may take a few minutes, please wait ....";
        mkdir -p /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/index.php ;
        service nginx start ;

        ##### install processmaker 3.2.2 #####
        cd /tmp/ && wget https://artifacts.processmaker.net/official/processmaker-3.2.2+001.tar.gz ;
        if grep -qs '/opt' /proc/mounts ; 
        then
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 270000); </script>@' /opt/processmaker/workflow/public_html/index.php ;
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 270000); </script>@' /opt/processmaker/workflow/public_html/app.php ;
        else
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 30000); </script>@' /opt/processmaker/workflow/public_html/index.php ;
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 30000); </script>@' /opt/processmaker/workflow/public_html/app.php ;
        fi
        tar -C /opt -xzvf processmaker-3.2.2+001.tar.gz ;
        cd /opt/processmaker/ ;
        chmod -R 770 shared workflow/public_html gulliver/js thirdparty/html2ps_pdf/cache ;
        cd /opt/processmaker/workflow/engine/ ;
        chmod -R 770 config content/languages plugins xmlform js/labels ;
        chown -R nginx:nginx /opt/processmaker ;
        rm -rf /tmp/processmaker-3.2.2+001.tar.gz ;
        
    else
    ##### install processmaker with PM_URL#####
        
        echo "ProcessMaker is being installed this may take a few minutes, please wait ....";
        mkdir -p /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/index.php ;
        service nginx start ;

        cd /tmp/ && wget ${PM_URL} ;
        if grep -qs '/opt' /proc/mounts ; 
        then
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 270000); </script>@' /opt/processmaker/workflow/public_html/index.php ;
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 270000); </script>@' /opt/processmaker/workflow/public_html/app.php ;
        else
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 30000); </script>@' /opt/processmaker/workflow/public_html/index.php ;
            sed -i 's@<script>setTimeout("document.location.reload()", 10000); </script>@<script>setTimeout("document.location.reload()", 30000); </script>@' /opt/processmaker/workflow/public_html/app.php ;
        fi
        tar -C /opt -xzvf processmaker* ;
        cd /opt/processmaker/ ;
        chmod -R 770 shared workflow/public_html gulliver/js ;
        cd /opt/processmaker/workflow/engine/ ;
        chmod -R 770 config content/languages plugins xmlform js/labels ;
        chown -R nginx:nginx /opt/processmaker ;
        rm -rf /tmp/processmaker* ;

        if [ -d /opt/processmaker/gulliver/thirdparty/html2ps_pdf/cache/ ];
        then
            chmod -R 770 /opt/processmaker/gulliver/thirdparty/html2ps_pdf/cache ;
        else
            chmod -R 770 /opt/processmaker/thirdparty/html2ps_pdf/cache ;
        fi
    fi
    sleep 5 ;
    service php-fpm restart ;
    service nginx stop ;
fi
echo "
       ░░░░░░░
    ░░░░░░░░░░░░░
   ░░░░       ░░░░     WELCOME TO PROCESSMAKER STACK N220 -> ( amazonlinux:2017.09 ; NGINX-1.12 ; PHP-5.6 )
  ░░░░  ░░░░░   ░░░
  ░░░  ░░░░░░░  ░░░░   - This ProcessMaker Stack uses MySql 5.6
  ░░░  ░░░░░░   ░░░    - The following command runs mysql56 in Docker:
   ░░  ░░     ░░░░     -> docker run --name pm-db56 -e MYSQL_ROOT_PASSWORD=PM-Testdb -p 3306:3306 -d mysql:5.6
    ░  ░░░░░░░░░       
       ░░░░░░░         For more information see https://www.processmaker.com
                                                http://wiki.processmaker.com/3.2/Supported_Stacks
	 " ; 
nginx -g 'daemon off;' ;
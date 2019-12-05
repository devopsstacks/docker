#!/bin/bash

    if [[ -z "${PM_URL}" ]];
    then
        echo "ProccessMaker is not installed";
        mkdir -p /opt/processmaker/workflow/public_html/ ;
        echo '<H1 align="center" align="bottom"><font color="2E9AFE" style="font-size:2vw;">ProccessMaker is not installed </font></H1>' > /opt/processmaker/workflow/public_html/index.php ;
        echo '<H1 align="center" align="bottom"><font color="2E9AFE" style="font-size:2vw;">ProccessMaker is not installed </font></H1>' > /opt/processmaker/workflow/public_html/app.php ;
        service nginx start ;
    else        
        mkdir -p /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/index.php ;
        service nginx start ;

        ##### install processmaker #####
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
#!/bin/bash

    if [[ -z "${PM_URL}" ]];then
        echo "ProccessMaker is already installed";        
    else
    ##### install processmaker with PM_URL#####
        rm -rf /opt/processmaker ;
        echo "ProcessMaker is being installed this may take a few minutes, please wait ....";
        mkdir -p /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/ ;
        cp /tmp/app.php /opt/processmaker/workflow/public_html/index.php ;
        service nginx start ;

        cd /tmp/ && wget ${PM_URL} ;
        tar -C /opt -xzvf processmaker* ;
        cd /opt/processmaker/ ;
        chmod -R 770 shared workflow/public_html gulliver/js ;
        cd /opt/processmaker/workflow/engine/ ;
        chmod -R 770 config content/languages plugins xmlform js/labels ;
        chown -R nginx:nginx /opt/processmaker ;
        rm -rf /tmp/processmaker* ;

        if [ -d /opt/processmaker/gulliver/thirdparty/html2ps_pdf/cache/ ];then
            chmod -R 770 /opt/processmaker/gulliver/thirdparty/html2ps_pdf/cache ;
        else
            chmod -R 770 /opt/processmaker/thirdparty/html2ps_pdf/cache ;
        fi
    fi
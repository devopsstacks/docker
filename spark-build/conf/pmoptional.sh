#!/bin/bash

    if [[ -z "${PM_URL}" ]];
    then
        echo "ProccessMaker Spark is not installed";
        
    else        
        
        ##### install processmaker #####
        pm_var=$(echo "${PM_URL}" | tr "/" "\n" | grep  "tar.gz") ;
        cd /tmp/ && rm -rf ${pm_var} ;        
        wget ${PM_URL} ;
        
        tar -C /opt -xzvf ${pm_var} ;
        cd /opt ;
        pm_var_sp=$(echo "${pm_var}" | cut -d"." -f1) ;
        echo ${pm_var_sp} ;
        mv ${pm_var_sp} processmaker ;
        chown -R nginx:nginx /opt/processmaker ;
        rm -rf /tmp/${pm_var} ;
        cd /opt/processmaker ;
        npm install -g laravel-echo-server ;
        sed -i '/"protocol": "https",/c\"protocol": "http",' /opt/processmaker/laravel-echo-server.json ;
        sed -i '/"sslCertPath": "\/etc\/nginx\/ssl\/spark.local.processmaker.com.crt",/c\"sslCertPath": "",' /opt/processmaker/laravel-echo-server.json ;
        sed -i '/"sslKeyPath": "\/etc\/nginx\/ssl\/spark.local.processmaker.com.key",/c\"sslKeyPath": "",' /opt/processmaker/laravel-echo-server.json ;
        php artisan spark:install ;
        sed -i 's/DB_HOSTNAME/DB_HOST/' /opt/processmaker/.env ;
        chgrp -R nginx storage bootstrap/cache ;
        chmod -R ug+rwx storage bootstrap/cache ;

                
    fi
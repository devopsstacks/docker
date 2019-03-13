#!/bin/bash

    if [[ -z "${PM_URL}" ]];
    then
        echo "ProccessMaker4 is not installed";
        
    else        
        
        ##### install processmaker #####
        cd /tmp/ && wget ${PM_URL} ;

        tar -C /opt -xzvf bpm4_*.tar.gz ;
        cd /opt ;
        mv bpm_* processmaker ;
        chown -R nginx:nginx /opt/processmaker ;
        rm -rf /tmp/bpm4_*.tar.gz ;
        cd /opt/processmaker ;
        sudo npm install -g laravel-echo-server ;
        cp /opt/processmaker/homestead/etc/supervisor/conf.d/processmaker-* /etc/supervisord.d/
        
    fi
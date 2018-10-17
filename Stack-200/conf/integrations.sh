#!/bin/bash

if [[ -z "${PM_PGSQL}" ]];then
    echo "PostgreSQL connection is not installed" ;    
else
    if  [ -f /etc/php.d/*pgsql.ini ] ; then
        echo "PGSQL connection is already installed" ;
    else
        if [ "${PM_PGSQL}" == "install" ];then
            yum install -y php55-pgsql ;
        fi
    fi
fi

if [[ -z "${PM_MSSQL}" ]];then
    echo "MSSQL connection is not installed" ;
else
    if  [ -f /etc/php.d/*mssql.ini] ; then
        echo "MSSQL connection is already installed" ;
    else
        if [ "${PM_MSSQL}" == "install" ];then
            yum install -y freetds php55-mssql ;
        fi
    fi
fi

if [[ -z "${PM_ODBC}" ]];then
    echo "ODBC connection is not installed" ;
else
    if  [ -f /etc/php.d/*odbc.ini] ; then
        echo "ODBC connection is already installed" ;
    else
        if [ "${PM_ODBC}" == "install" ];then
            yum install -y unixODBC unixODBC-devel php55-odbc ;
        fi
    fi
fi

if [[ -z "${PM_OCI}" ]];then
    echo "Oracle connection is not installed" ;
else
    yum install -y which ;
    if [ -f /usr/lib64/php/5.5/modules/*oci8.so ]; then
	    echo "Oracle connection is already installed" ;
	else
        yum install -y php55-devel php55-pecl-apcu gcc libaio ;
        cd /tmp ;
        if [ "${PM_OCI}" == "10" ];then
            wget https://artifacts.processmaker.net/dbintegrations/oracle-10.2-basic.tar.gz ;
            wget https://artifacts.processmaker.net/dbintegrations/oracle-10.2-devel.tar.gz ;
            rpm -Uvh /tmp/oracle-10.2-basic.tar.gz ;
            rpm -Uvh /tmp/oracle-10.2-devel.tar.gz ;
        fi
        if [ "${PM_OCI}" == "11" ];then
            wget https://artifacts.processmaker.net/dbintegrations/oracle-11.2-basic.tar.gz ;
            wget https://artifacts.processmaker.net/dbintegrations/oracle-11.2-devel.tar.gz ;
            rpm -Uvh /tmp/oracle-11.2-basic.tar.gz ;
            rpm -Uvh /tmp/oracle-11.2-devel.tar.gz ;
        fi
        if [ "${PM_OCI}" == "12" ];then
            wget https://artifacts.processmaker.net/dbintegrations/oracle-12.2-basic.tar.gz ;
            wget https://artifacts.processmaker.net/dbintegrations/oracle-12.2-devel.tar.gz ;
            rpm -Uvh /tmp/oracle-12.2-basic.tar.gz ;
            rpm -Uvh /tmp/oracle-12.2-devel.tar.gz ;
        fi
        printf "\n" | pecl install oci8-2.0.12 ;
        echo "extension=oci8.so" >> /etc/php.ini ;
    fi
fi
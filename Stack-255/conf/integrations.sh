#!/bin/bash

if [[ -z "${PM_PGSQL}" ]];then
    echo "PostgreSQL connection is not installed" ;    
else
    if  [ -f /etc/php.d/*pgsql.ini ] ; then
        echo "PGSQL connection is already installed" ;
    else
        if [ "${PM_PGSQL}" == "install" ];then
            yum install -y php71-pgsql ;
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
            curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo ;
            
            yum remove -y unixODBC* ;
            yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-14.el7.x86_64.rpm ;
            yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-devel-2.3.1-14.el7.x86_64.rpm ;
            
            yum install -y gcc-c++ gcc php71-devel ;
            yum install -y php71-odbc ;
            yum install -y php7-pear ;
            ACCEPT_EULA=Y yum install -y msodbcsql ;
            pecl7 install sqlsrv ;
            pecl7 install pdo_sqlsrv ;
            echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini ;
            echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20-sqlsrv.ini ;
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
            yum install -y unixODBC unixODBC-devel php71-odbc ;
        fi
    fi
fi

if [[ -z "${PM_OCI}" ]];then
    echo "Oracle connection is not installed" ;
else
    yum install -y which ;
    if [ -x "$(which pecl)" ]; then
	    echo "Oracle connection is already installed" ;
	else
        yum install -y php71-devel php71-pecl-apcu gcc libaio php7-pear ;
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
        printf "\n" | pecl7 install oci8-2.1.8 ;
        echo "extension=oci8.so" >> /etc/php.ini ;
    fi
fi
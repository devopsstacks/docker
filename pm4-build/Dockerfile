# Base Image
FROM circleci/php:7.2.8-fpm-node-browsers

RUN sudo apt-get update && sudo apt install -y libpng-dev libzip-dev default-libmysqlclient-dev curl apt-transport-https
RUN sudo docker-php-ext-install gd zip pdo_mysql mysqli
RUN sudo apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN sudo docker-php-ext-install -j$(nproc) iconv
RUN sudo docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN sudo docker-php-ext-install -j$(nproc) gd
RUN sudo docker-php-ext-install -j$(nproc) pcntl
RUN sudo docker-php-ext-install -j$(nproc) exif
RUN sudo chmod 777 /opt
RUN sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && \
    sudo sh  -c 'curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list' && \
    sudo apt-get install -y locales && \
    sudo sh -c 'echo "en_US.UTF-8 UTF-8" > /etc/locale.gen' && \
    sudo locale-gen && \
    sudo apt-get update && \
    sudo ACCEPT_EULA=Y apt-get install msodbcsql && \
    sudo apt-get install unixodbc-dev && \
    sudo pecl install sqlsrv && \
    sudo pecl install pdo_sqlsrv && \
    sudo docker-php-ext-enable sqlsrv pdo_sqlsrv

RUN echo "deb http://deb.debian.org/debian jessie main" | sudo tee -a /etc/apt/sources.list && \
    sudo apt-get update && \
    sudo apt-get install libssl1.0.0

ENTRYPOINT ["/bin/bash"]
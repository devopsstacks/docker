# Base Image
FROM bayesimpact/circleci

RUN apt-get update && \
    apt install -y apt-transport-https lsb-release ca-certificates && \
    apt install -y apt-utils && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
    apt-get update && \
    apt install -y php7.2 php7.2-common php7.2-cli php7.2-fpm php7.2-mysql php7.2-xml php7.2-curl php7.2-mbstring php7.2-zip && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT ["/bin/bash"]
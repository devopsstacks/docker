# Base Image
FROM amazonlinux:2017.09

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-version = "3.2.2" \
      processmaker-stack="N220"

# Install processmaker 
COPY ["conf/installpm.sh", "/tmp/"]
COPY ["conf/servicespm.sh", "/usr/bin/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh      
COPY ["conf/php-fpm.conf", "/etc/php-fpm.d/processmaker.conf"]
COPY ["conf/nginx.conf", "/etc/nginx/nginx.conf"]
COPY ["conf/processmaker.conf", "/etc/nginx/conf.d/processmaker.conf"]
COPY ["conf/app.php", "/tmp/"]

# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
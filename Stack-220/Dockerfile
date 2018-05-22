# Base Image
FROM amazonlinux:2017.09

# Maintainer
MAINTAINER Team DevOps "devops@processmaker.com"

LABEL processmaker-version = "3.2.2" \
      processmaker-stack="220"

# Install processmaker 
COPY ["installpm.sh", "/tmp/"]
COPY ["servicespm.sh", "/usr/bin/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh      
COPY ["php-fpm.conf", "/etc/php-fpm.d/processmaker.conf"]
COPY ["nginx.conf", "/etc/nginx/nginx.conf"]
COPY ["processmaker.conf", "/etc/nginx/conf.d/processmaker.conf"]

# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
# Base Image
FROM amazonlinux

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-stack="pm4"

# Install processmaker 
COPY ["conf/installpm.sh", "/tmp/"]
COPY ["conf/pmoptional.sh", "/tmp/"]
COPY ["conf/servicespm.sh", "/usr/bin/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /tmp/pmoptional.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh      
COPY ["conf/php-fpm.conf", "/etc/php-fpm.d/processmaker.conf"]
COPY ["conf/nginx.conf", "/etc/nginx/nginx.conf"]
COPY ["conf/processmaker.conf", "/etc/nginx/conf.d/processmaker.conf"]
COPY ["conf/processmaker-horizon.conf", "/etc/supervisord.d/processmaker-horizon.conf"]
COPY ["conf/processmaker-echo-server.conf", "/etc/supervisord.d/processmaker-echo-server.conf"]


# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
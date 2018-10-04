# Base Image
FROM amazonlinux:2017.09

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-stack="205"

# Install processmaker 
COPY ["conf/installpm.sh", "/tmp/"]
COPY ["conf/integrations.sh", "/tmp/"]
COPY ["conf/pmoptional.sh", "/tmp/"]
COPY ["conf/servicespm.sh", "/usr/bin/"]
COPY ["conf/pmos.conf", "/etc/httpd/conf.d/"]
COPY ["conf/app.php", "/tmp/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /tmp/integrations.sh && \
     chmod 700 /tmp/pmoptional.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh
     
# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
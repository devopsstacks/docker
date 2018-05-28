# Base Image
FROM amazonlinux:2017.09

# Maintainer
MAINTAINER Team DevOps "devops@processmaker.com"

LABEL processmaker-stack="200"

# Install processmaker 
COPY ["installpm.sh", "/tmp/"]
COPY ["servicespm.sh", "/usr/bin/"]
COPY ["pmos.conf", "/etc/httpd/conf.d/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh
     
# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
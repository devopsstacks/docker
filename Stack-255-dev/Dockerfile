# Base Image
FROM amazonlinux:2017.09

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-stack="255"

# Install processmaker 
COPY ["conf/installpm.sh", "/tmp/"]
COPY ["conf/integrations.sh", "/tmp/"]
COPY ["conf/pmoptional.sh", "/tmp/"]
COPY ["conf/servicespm.sh", "/usr/bin/"]
COPY ["conf/pmos.conf", "/etc/httpd/conf.d/"]
COPY ["conf/app.php", "/tmp/"]
COPY ["conf/development.sh", "/tmp/"]
RUN  chmod 700 /tmp/installpm.sh && \
     chmod 700 /tmp/development.sh && \
     chmod 700 /tmp/integrations.sh && \
     chmod 700 /tmp/pmoptional.sh && \
     chmod 700 /usr/bin/servicespm.sh && \
     /bin/sh /tmp/installpm.sh && \
     /bin/sh /tmp/development.sh
RUN yum install -y php70-gd php70-mysqlnd php70-soap php70-mbstring php70-ldap php70-mcrypt php70-xml php70-imap 
RUN yum install -y php72-gd php72-mysqlnd php72-soap php72-mbstring php72-ldap php72-mcrypt php72-xml php72-imap 
RUN yum install -y php56-gd php56-mysqlnd php56-soap php56-mbstring php56-ldap php56-mcrypt php56-xml php56-imap 
     
# Docker entrypoint
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/servicespm.sh"]
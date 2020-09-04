# Base Image
FROM amazonlinux:2017.09

RUN yum install -y php70-gd php70-mysqlnd php70-soap php70-mbstring php70-ldap php70-mcrypt php70-xml php70-imap 
RUN yum install -y php72-gd php72-mysqlnd php72-soap php72-mbstring php72-ldap php72-mcrypt php72-xml php72-imap 
RUN yum install -y php56-gd php56-mysqlnd php56-soap php56-mbstring php56-ldap php56-mcrypt php56-xml php56-imap

ENTRYPOINT ["/bin/bash"]


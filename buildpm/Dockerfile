# Base Image
FROM centos:7

# Maintainer
LABEL maintainer="devops@processmaker.com"

LABEL processmaker-stack="pm-build"

COPY ["conf/development.sh", "/tmp/"]
RUN yum -y update
ENV PATH /usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv
ENV CONFIGURE_OPTS --disable-install-doc
ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH
ENV RBENV_VERSION 2.4.0
RUN  chmod 700 /tmp/development.sh && \
     /bin/sh /tmp/development.sh
# Docker entrypoint
EXPOSE 80 443
CMD ["/bin/bash"] -D FOREGROUND
#ENTRYPOINT ["/usr/bin/servicespm.sh"]